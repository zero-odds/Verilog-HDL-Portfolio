# Verilog HDL Projects

Learning Verilog HDL as part of my 4th semester VLSI track. Building from fundamentals to full projects over 6 weeks.

## 📁 Repository Structure
* `/Week_1_Basics` — Combinational logic gates, multiplexers, and adders.
* `/week_2_sequential` — Edge-triggered memory elements, registers, and counters.

## ✅ Completed

### Week 1: Combinational Circuits
* **AND Gate** — basic logic gate using assign statement
* **2:1 MUX** — multiplexer using assign and ternary operator
* **4:1 MUX** — multiplexer using nested ternary operator
* **Half Adder** — sum and carry using XOR and AND
* **Full Adder** — 3 input adder with carry in and carry out
* **Project: 4-bit Ripple Carry Adder** — 4 Full Adders chained together using module instantiation and internal carry wires

### Week 2: Sequential Circuits
* **D Flip-Flop** — positive edge-triggered 1-bit memory element using `reg` and non-blocking (`<=`) assignments, complete with an independent clock generation testbench.

## ⏳ In Progress
* **Week 2:** JK/T Flip-Flops and 4-bit UP/DOWN Counters

## 🚀 Coming Soon
* 4-bit ALU Project & Vivado Setup (Week 3)
* Finite State Machines (Week 4)
* VGA Sync Generator (Week 5)

## 🛠️ Tools Used
* JDoodle Online Verilog Compiler
* Icarus Verilog (local simulation)
* VS Code (Editing and Git Integration)
* Git and GitHub

## 💻 How to Simulate Locally
Install Icarus Verilog then run:
```bash
iverilog -o output filename.v tb_filename.v
vvp output