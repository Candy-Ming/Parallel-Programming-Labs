# CPU Architecture Lab 1 - Cache & ILP Optimization

本项目为《并行程序设计 / CPU 架构相关编程》课程 Lab1 实验代码与结果。

实验主要研究：在算法复杂度相同的情况下，不同实现方式（访问模式 / 指令依赖）对程序性能的影响，并结合 Intel VTune Profiler 进行分析。

---

## 📌 实验内容

### 问题一：矩阵-向量内积优化

计算：
y_i = sum(A[j][i] * x[j])

实现三种版本：

- dot_naive：按列访问（cache 不友好）
- dot_cache：按行访问（提升空间局部性）
- dot_unroll：循环展开（降低控制开销，提高指令级并行）

---

### 问题二：求和算法 ILP 优化

计算：
S = sum(a[i])

实现两种版本：

- sum_naive：单累加器（存在长依赖链）
- sum_ilp2：双累加器（提高指令级并行性）

---

## 📁 文件结构

```text
.
├── lab1_dot.cpp
├── lab1_sum.cpp
├── dot_results.csv
├── sum_results.csv
└── README.md
```

---

## ⚙️ 编译与运行

### 编译

```bash
g++ -O3 -std=c++17 lab1_dot.cpp -o lab1_dot.exe
g++ -O3 -std=c++17 lab1_sum.cpp -o lab1_sum.exe
```

### 运行

```bash
./lab1_dot.exe
./lab1_sum.exe
```

（Windows PowerShell 使用：.\lab1_dot.exe）

---

## 📊 输出结果

程序运行后会：

- 在终端输出不同规模下的运行时间与加速比
- 自动生成 CSV 文件：
  - dot_results.csv
  - sum_results.csv

---

## 🔬 实验环境

- 操作系统：Windows 11
- CPU：Intel Raptor Lake
- 编译器：g++
- 分析工具：Intel VTune Profiler

---

## 📈 实验结论（简要）

- Cache 优化通过改善数据访问模式，显著降低 memory stall
- ILP 优化通过削弱依赖链，提高执行单元利用率
- VTune 分析验证了性能瓶颈的变化

---

## 📎 说明

本仓库对应课程实验报告，包含完整实验代码与结果数据。