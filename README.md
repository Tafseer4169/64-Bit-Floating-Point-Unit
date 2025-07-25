

---

# ⚙️ **64-Bit Floating Point Unit**

**64-Bit Floating Point Unit** is a Verilog-based hardware design project implementing a custom IEEE-754 compliant floating-point arithmetic unit. It supports **addition**, **subtraction**, **multiplication**, and **division** operations using double-precision (64-bit) floating-point numbers. This project can serve as a reference design for FPGA-based computation units or educational tools for digital and VLSI design.

---

## 🧠 **Key Features**

### ➕➖ **Addition & Subtraction**

* Supports IEEE-754 double-precision format.
* Handles normalization, alignment of mantissas, and result rounding.
* Includes edge case handling for **NaN**, **Infinity**, and **denormalized numbers**.

### ✖️ **Multiplication**

* Implements 106-bit intermediate product.
* Includes **exponent calculation**, **normalization**, and **rounding**.
* Handles **overflow**, **underflow**, and **exception flags**.

### ➗ **Division**

* Uses fixed-point division by shifting the mantissa.
* Handles divide-by-zero and zero-dividend scenarios.
* Supports normalization and rounding to produce IEEE-754-compliant result.

---

## 🏗️ **Architecture Overview**

The top module `fpu_unit` is composed of the following components:

* **Program Counter (PC):** 8-bit synchronous counter for instruction sequencing.
* **Instruction Memory:** 16-bit wide instruction format, supports simple FSM-based control.
* **Data Memory:** 128-bit memory space holding two 64-bit operands.
* **Floating Point Unit (`fpu`):** Executes operation based on decoded opcode (00: add, 01: sub, 10: mul, 11: div).
* **Internal Units:**

  * `fpu_add_sub` for addition/subtraction
  * `fpu_mul` for multiplication
  * `fpu_div` for division

---

## 🛠️ **Tools & Technologies Used**

* **Verilog HDL**
* **ModelSim / Vivado / any Verilog simulator**
* **IEEE-754 double-precision standard**
* **Behavioral modeling**

---

## 🧪 **Test & Simulation**

* You can simulate this project using any standard Verilog simulator (e.g., ModelSim, Vivado).
* You may initialize `InstructionMemory` and `DataMemory` using test files:

  ```verilog
  // Uncomment to use memory initialization
  // initial $readmemh("instruction.mem", mem);
  // initial $readmemh("data.mem", mem);
  ```

---

## 📁 **Directory Structure**

```
├── floating_point_unit.v              # Top module
├── fpu_tb.v                           # Test Bench
├── fpu_tb2.v                          # Test Bench with special case
├── README.md                          # Project documentation
```

---

## 📚 **License**

This project is licensed under the **MIT License**.

---

**Thank you for exploring the 64-Bit Floating Point Unit!**
For improvements, collaboration, or academic references—feel free to contribute or reach out.

---


