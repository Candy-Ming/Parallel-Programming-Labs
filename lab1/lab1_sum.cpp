#include <iostream>
#include <vector>
#include <windows.h>
#include <iomanip>
#include <fstream>
#include <cstdlib>

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

// 初始化数据（用固定伪随机数，便于复现）
void init_data(vector<int>& a, int n) {
    srand(42);
    for (int i = 0; i < n; i++) {
        a[i] = rand() % 100;
    }
}

// 平凡算法：逐个累加
long long sum_naive(const vector<int>& a, int n) {
    long long sum = 0;
    for (int i = 0; i < n; i++) {
        sum += a[i];
    }
    return sum;
}

// 两路累加：减少链式依赖
long long sum_ilp2(const vector<int>& a, int n) {
    long long sum0 = 0, sum1 = 0;
    int i = 0;

    for (; i + 1 < n; i += 2) {
        sum0 += a[i];
        sum1 += a[i + 1];
    }

    if (i < n) {
        sum0 += a[i];
    }

    return sum0 + sum1;
}

// 检查结果一致性
bool check_same(long long x, long long y) {
    return x == y;
}

// 根据规模自动选择重复次数
int choose_repeat(int n) {
    if (n <= (1 << 10)) return 10000;
    if (n <= (1 << 15)) return 2000;
    if (n <= (1 << 20)) return 200;
    return 20;
}

// 单次测试
void run_case(int n, int repeat, ofstream& csv_file) {
    vector<int> a(n);
    init_data(a, n);

    // 热身
    long long ans1 = sum_naive(a, n);
    long long ans2 = sum_ilp2(a, n);

    if (!check_same(ans1, ans2)) {
        cout << "Result mismatch at n = " << n << endl;
        csv_file << n << ",ERROR,ERROR,ERROR\n";
        return;
    }

    // 计时 naive
    double t1_begin = now_us();
    for (int r = 0; r < repeat; r++) {
        volatile long long tmp = sum_naive(a, n);
        (void)tmp;
    }
    double t1_end = now_us();

    // 计时 ilp2
    double t2_begin = now_us();
    for (int r = 0; r < repeat; r++) {
        volatile long long tmp = sum_ilp2(a, n);
        (void)tmp;
    }
    double t2_end = now_us();

    double naive_avg = (t1_end - t1_begin) / repeat;
    double ilp2_avg  = (t2_end - t2_begin) / repeat;
    double speedup   = naive_avg / ilp2_avg;

    cout << setw(12) << n
         << setw(18) << fixed << setprecision(3) << naive_avg
         << setw(18) << fixed << setprecision(3) << ilp2_avg
         << setw(16) << fixed << setprecision(3) << speedup
         << endl;

    csv_file << n << ","
             << fixed << setprecision(3)
             << naive_avg << ","
             << ilp2_avg << ","
             << speedup << "\n";
}

int main() {
    ofstream csv_file("sum_results.csv");
    if (!csv_file.is_open()) {
        cerr << "Failed to open sum_results.csv" << endl;
        return 1;
    }

    csv_file << "n,naive_us,ilp2_us,speedup\n";

    cout << "Sum of N Numbers Test" << endl;
    cout << setw(12) << "n"
         << setw(18) << "naive(us)"
         << setw(18) << "ilp2(us)"
         << setw(16) << "speedup"
         << endl;

    vector<int> sizes = {
        1 << 7,
        1 << 8,
        1 << 9,
        1 << 10,
        1 << 12,
        1 << 14,
        1 << 16,
        1 << 18,
        1 << 20,
        1 << 22
    };

    for (int n : sizes) {
        int repeat = choose_repeat(n);
        run_case(n, repeat, csv_file);
    }

    csv_file.close();

    cout << "\nResults have been saved to sum_results.csv" << endl;
    return 0;
}