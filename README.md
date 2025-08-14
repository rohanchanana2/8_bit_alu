# 8-bit ALU (Arithmetic Logic Unit)

An 8-bit ALU module in Verilog that efficiently performs essential arithmetic and logic operations, with key status flags.

---

## 🚀 Features  

- **Operations Supported:**
  - `000` — Addition (a + b) with carry & overflow flags 
  - `001` — Subtraction (a - b)  with borrow & overflow flags
  - `010` — Bitwise AND (a & b)  
  - `011` — Bitwise OR (a | b)  
  - `100` — Bitwise XOR (a ^ b)  
  - `101` — Logical Left Shift (a << 1)  with carry = shifted out bit
  - `110` — Logical Right Shift (a >> 1)  with carry = shifted out bit 
  - `111` — Pass-through (output = input a)  

- **🚩 Status Flags:** 
  - `carry` — Carry out or shifted out bit  
  - `borrow` — Borrow flag for subtraction  
  - `overflow` — Signed overflow detection  
  - `zero` — Output is zero  

---

## 🛠️ Usage  

1. Compile & simulate with your preferred Verilog simulator (e.g., Icarus Verilog):  
   ```bash
   iverilog -o alu.vvp alu_8_bit.v test.v
   vvp alu.vvp
   ```

2. Open the waveform file to inspect signals visually:
   ```bash
   gtkwave alu_8_bit.vcd
   ```
---

## 📂 Files
  - `alu_8_bit.v` — 8-bit ALU Verilog module  
  - `test.v` — Testbench for verifying ALU operations  

---
