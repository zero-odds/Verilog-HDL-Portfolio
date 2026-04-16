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

### Week 2: Sequential Circuits (`Week_2_Sequential/`)
- **Basic D Flip-Flop** - single-bit memory storage on the active clock edge
- **T (Toggle) Flip-Flop** - toggles output state on each active clock edge when enabled
- **D Flip-Flop (Synchronous Reset)** - reset evaluates only on the active clock edge
- **D Flip-Flop (Asynchronous Reset)** - reset evaluates instantly, overriding the clock
- **2-Stage Shift Register** - physical demonstration of Blocking (`=`) vs. Non-Blocking (`<=`) assignments
- **4-Bit Register** - 4-bit wide parallel data storage with asynchronous reset
- **4-Bit UP Counter** - counts from 0 to 15 with an active-high enable switch and synchronous reset
- **Project: 4-Bit Universal UP/DOWN Counter** - final week 2 project; counts up/down with a control signal and case statement selector

### Week 3: Combinational Logic & Synthesis (`Week_3_ALU/`)
- **Project: 4-Bit ALU & Hardware Synthesis** - final week 3 project; designed an Arithmetic Logic Unit capable of 8 simultaneous operations (ADD, SUB, AND, OR, XOR, INV, LSHIFT, RSHIFT). Simulated with a testbench and successfully synthesized into physical Look-Up Tables (LUTs) for an Artix-7 FPGA using Xilinx Vivado.
- **Hardware Visualization:**
*Below: Behavioral simulation of the ALU operations, and the physical Artix-7 LUT synthesis.*

![ALU Waveforms](Week_3_ALU/images/alu_waveform.png)
![ALU Schematic](Week_3_ALU/images/alu_schematic.png)

### Week 4: Finite State Machines (`Week_4_FSM/`)
- **Traffic Light Controller** - Designed a Moore Machine FSM to cycle through Green, Yellow, and Red states using an internal counter. Simulated and verified with Icarus Verilog.
### Hardware Visualization
*Below: Behavioral simulation of the state transitions, and the physical Artix-7 LUT synthesis.*

![FSM Waveform](Week_4_FSM/fsm_waveform.png)
![FSM Schematic](Week_4_FSM/fsm_schematic.png)

## 🚀 Coming Soon
- VGA Sync Generator (Week 5)