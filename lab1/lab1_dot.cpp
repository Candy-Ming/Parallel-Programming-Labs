#include <iostream>
#include <vector>
#include <windows.h>
#include <iomanip>
#include <fstream>

using namespace std;

// 高精度计时器（Windows, 微秒）
double now_us() {
    static LARGE_INTEGER freq;
    static bool initialized = false;
    if (!initialized) {
        QueryPerformanceFrequency(&freq);
        initialized = true;
    }

    LARGE_INTEGER counter;
    QueryPerformanceCounter(&counter);
    return 1000000.0 * counter.QuadPart / freq.QuadPart;
}

// 初始化数据
void init_data(vector<int>& a, vector<vector<int>>& b, int n) {
    for (int i = 0; i < n; i++) {
        a[i] = i;
    }

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            b[i][j] = i + j;
        }
    }
}

// 平凡算法：按列访问
void dot_naive(const vector<int>& a, const vector<vector<int>>& b,
               vector<long long>& res, int n) {
    for (int i = 0; i < n; i++) {
        res[i] = 0;
        for (int j = 0; j < n; j++) {
            res[i] += 1LL * a[j] * b[j][i];
        }
    }
}

// Cache 优化算法：按行访问
void dot_cache(const vector<int>& a, const vector<vector<int>>& b,
               vector<long long>& res, int n) {
    for (int i = 0; i < n; i++) {
        res[i] = 0;
    }

    for (int j = 0; j < n; j++) {
        for (int i = 0; i < n; i++) {
            res[i] += 1LL * a[j] * b[j][i];
        }
    }
}

// 循环展开算法：在 cache 优化基础上展开（这里用 4 路展开）
void dot_unroll(const vector<int>& a, const vector<vector<int>>& b,
                vector<long long>& res, int n) {
    for (int i = 0; i < n; i++) {
        res[i] = 0;
    }

    for (int j = 0; j < n; j++) {
        int i = 0;
        for (; i + 3 < n; i += 4) {
            res[i]     += 1LL * a[j] * b[j][i];
            res[i + 1] += 1LL * a[j] * b[j][i + 1];
            res[i + 2] += 1LL * a[j] * b[j][i + 2];
            res[i + 3] += 1LL * a[j] * b[j][i + 3];
        }
        for (; i < n; i++) {
            res[i] += 1LL * a[j] * b[j][i];
        }
    }
}

// 检查两个结果是否一致
bool check_same(const vector<long long>& x, const vector<long long>& y) {
    if (x.size() != y.size()) return false;
    for (size_t i = 0; i < x.size(); i++) {
        if (x[i] != y[i]) return false;
    }
    return true;
}

// 根据规模自动选择重复次数（小规模多测几次，大规模少测几次）
int choose_repeat(int n) {
    if (n <= 100) return 500;
    if (n <= 512) return 100;
    if (n <= 2048) return 20;
    return 5;
}

// 单次测试某个规模 n
void run_case(int n, int repeat, ofstream& csv_file) {
    vector<int> a(n);
    vector<vector<int>> b(n, vector<int>(n));
    vector<long long> res1(n), res2(n), res3(n);

    init_data(a, b, n);

    // 热身
    dot_naive(a, b, res1, n);
    dot_cache(a, b, res2, n);
    dot_unroll(a, b, res3, n);

    // 正确性检查
    if (!check_same(res1, res2) || !check_same(res1, res3)) {
        cout << "Result mismatch at n = " << n << endl;
        csv_file << n << ",ERROR,ERROR,ERROR,ERROR,ERROR\n";
        return;
    }

    // 计时 naive
    double t1_begin = now_us();
    for (int r = 0; r < repeat; r++) {
        dot_naive(a, b, res1, n);
    }
    double t1_end = now_us();

    // 计时 cache
    double t2_begin = now_us();
    for (int r = 0; r < repeat; r++) {
        dot_cache(a, b, res2, n);
    }
    double t2_end = now_us();

    // 计时 unroll
    double t3_begin = now_us();
    for (int r = 0; r < repeat; r++) {
        dot_unroll(a, b, res3, n);
    }
    double t3_end = now_us();

    double naive_avg  = (t1_end - t1_begin) / repeat;
    double cache_avg  = (t2_end - t2_begin) / repeat;
    double unroll_avg = (t3_end - t3_begin) / repeat;

    double spd_cache  = naive_avg / cache_avg;
    double spd_unroll = naive_avg / unroll_avg;

    // 终端表格输出
    cout << setw(8)  << n
         << setw(16) << fixed << setprecision(3) << naive_avg
         << setw(16) << fixed << setprecision(3) << cache_avg
         << setw(16) << fixed << setprecision(3) << unroll_avg
         << setw(16) << fixed << setprecision(3) << spd_cache
         << setw(16) << fixed << setprecision(3) << spd_unroll
         << endl;

    // CSV 输出
    csv_file << n << ","
             << fixed << setprecision(3)
             << naive_avg << ","
             << cache_avg << ","
             << unroll_avg << ","
             << spd_cache << ","
             << spd_unroll << "\n";
}

int main() {
    // 打开 csv 文件
    ofstream csv_file("dot_results.csv");
    if (!csv_file.is_open()) {
        cerr << "Failed to open dot_results.csv" << endl;
        return 1;
    }

    // CSV 表头
    csv_file << "n,naive_us,cache_us,unroll_us,spd_cache,spd_unroll\n";

    // 终端标题
    cout << "Matrix-Vector Dot Product Test" << endl;
    cout << setw(8)  << "n"
         << setw(16) << "naive(us)"
         << setw(16) << "cache(us)"
         << setw(16) << "unroll(us)"
         << setw(16) << "spd_cache"
         << setw(16) << "spd_unroll"
         << endl;

    // 测试规模
    vector<int> sizes = {
        10, 100,
        128, 256, 512,
        1000, 2048, 2800, 5000
    };

    for (int n : sizes) {
        int repeat = choose_repeat(n);
        run_case(n, repeat, csv_file);
    }

    csv_file.close();

    cout << "\nResults have been saved to dot_results.csv" << endl;
    return 0;
}