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

## ⏳ In Progress

- **Week 2:** Blocking vs. Non-Blocking Assignments (Theory applied to sequential logic)
- **Week 2:** 4-bit UP/DOWN Counters

## 🚀 Coming Soon

- 4-bit ALU Project & Vivado Setup (Week 3)
- Finite State Machines (Week 4)
- VGA Sync Generator (Week 5)