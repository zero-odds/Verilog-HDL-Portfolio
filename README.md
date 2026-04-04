# Verilog HDL Portfolio

Learning Verilog from the ground up. Building from fundamental logic gates to complex sequential circuits.

## 🏁 Completed

### Week 1: Combinational Logic (`Week_1_Basics/`)
- AND Gate – basic behavioral modeling
- 2:1 MUX – multiplexer logic
- 4:1 MUX – multiplexer using case statements
- Half Adder – sum and carry logic
- Full Adder – 3 input addition
- **Project: 4-bit Ripple Carry Adder** – 4 Full Adders chained together using module instantiation and internal carry wires

### Week 2: Sequential Circuits (`week_2_sequential/`)
*(Note: All sequential modules are separated into industry-standard `_design.v` and `_tb.v` files)*
- **D Flip-Flop** – positive edge-triggered 1-bit memory element
- **T Flip-Flop** – toggle flip-flop built using conditional if-else logic
- **JK Flip-Flop** – universal flip-flop built using concatenation and case statements
- **D Flip-Flop (Synchronous Reset)** – reset evaluates only on the active clock edge
- **D Flip-Flop (Asynchronous Reset)** – reset evaluates instantly, overriding the clock
- **2-Stage Shift Register** – physical demonstration of Blocking (`=`) vs. Non-Blocking (`<=`) assignments
- **4-Bit Register** – 4-bit wide parallel data storage with asynchronous reset
- **4-Bit UP Counter** – counts from 0 to 15 with an active-high enable switch and synchronous reset
- **Project: 4-Bit Universal UP/DOWN Counter** – final week 2 project; counts up/down with dynamic MOD limits (MOD-16, 10, 6, 4) using a case statement selector

## ⏳ In Progress

- **Week 3:** 4-bit ALU Project & Vivado Setup (Starting Soon)

## 🚀 Coming Soon

- Finite State Machines (Week 4)
- VGA Sync Generator (Week 5)