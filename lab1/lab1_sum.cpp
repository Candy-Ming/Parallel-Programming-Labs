#include <iostream>
#include <vector>
#include <windows.h>
#include <iomanip>
#include <fstream>
#include <string>

using namespace std;

// 高精度计时器
double now_us() {
    static LARGE_INTEGER freq;
    QueryPerformanceFrequency(&freq);
    LARGE_INTEGER counter;
    QueryPerformanceCounter(&counter);
    return 1000000.0 * counter.QuadPart / freq.QuadPart;
}

void init_data(vector<int>& a, int n) {
    for (int i = 0; i < n; i++) a[i] = i % 100;
}

// -------------------------
// 四种算法实现
// -------------------------

// 1. 平凡算法
long long sum_naive(const vector<int>& a, int n) {
    long long sum = 0;
    for (int i = 0; i < n; i++) sum += a[i];
    return sum;
}

// 2. 平凡算法 + 循环展开 (单纯减少循环开销)
long long sum_naive_unroll(const vector<int>& a, int n) {
    long long sum = 0;
    int i = 0;
    for (; i <= n - 4; i += 4) {
        sum += a[i];
        sum += a[i + 1];
        sum += a[i + 2];
        sum += a[i + 3];
    }
    for (; i < n; i++) sum += a[i];
    return sum;
}

// 3. 两路累加 (ILP2: 打破数据依赖)
long long sum_ilp2(const vector<int>& a, int n) {
    long long s0 = 0, s1 = 0;
    int i = 0;
    for (; i <= n - 2; i += 2) {
        s0 += a[i];
        s1 += a[i + 1];
    }
    for (; i < n; i++) s0 += a[i];
    return s0 + s1;
}

// 4. 树形递归
long long tree_recursion_core(const int* data, int n) {
    if (n <= 128) {
        long long res = 0;
        for (int i = 0; i < n; ++i) res += data[i];
        return res;
    }
    int mid = n / 2;
    return tree_recursion_core(data, mid) + tree_recursion_core(data + mid, n - mid);
}
long long sum_tree(const vector<int>& a, int n) {
    return tree_recursion_core(a.data(), n);
}

// -------------------------
// Main 函数：支持 VTune 参数化测试
// -------------------------
int main(int argc, char* argv[]) {
    // VTune 参数设置：1:naive, 2:naive_unroll, 3:ilp2, 4:tree
    int mode = 0;
    if (argc > 1) {
        mode = atoi(argv[1]);
    } else {
        cout << "Select Algorithm (1:naive, 2:naive_unroll, 3:ilp2, 4:tree): ";
        cin >> mode;
    }

    // 为了让 VTune 测得准，选取一个较大的规模并增加循环次数
    int n = 1000000; 
    vector<int> a(n);
    init_data(a, n);

    const int repeat = 2000; // 增加重复次数，确保总运行时间在2秒以上
    long long total_check = 0;
    
    double start = now_us();

    for (int r = 0; r < repeat; r++) {
        a[0] = r; // 扰动，防止编译器将循环完全消除
        if (mode == 1) total_check += sum_naive(a, n);
        else if (mode == 2) total_check += sum_naive_unroll(a, n);
        else if (mode == 3) total_check += sum_ilp2(a, n);
        else if (mode == 4) total_check += sum_tree(a, n);
    }

    double avg_time = (now_us() - start) / repeat;

    // 防止编译器优化掉整个计算过程
    if (total_check == 1) cout << " "; 

    cout << "Algorithm Mode: " << mode << " | Avg Time: " << avg_time << " us" << endl;

    return 0;
}