# FPGA VGA Display Controller

## Overview
A custom hardware VGA display controller engineered from scratch using Verilog. This project divides a 100MHz system clock, tracks electron beam coordinates across a 640x480 grid, and generates precise industry-standard synchronization pulses to drive a physical monitor and render 12-bit RGB color patterns.

## Hardware Architecture
* **Clock Divider (`clk_div.v`):** Acts as the system heartbeat, reducing the 100MHz board clock to a perfectly timed 25MHz pixel clock.
* **Coordinate Trackers (`h_counter.v`, `v_counter.v`):** A chained counter system that maps the physical X/Y grid of the monitor. 
* **VGA Sync FSM (`vga_sync.v`):** The traffic controller. Generates precise `h_sync` and `v_sync` pulses, and enforces a `video_on` blanking safety net during porch intervals to prevent image smearing.
* **Top Level Router (`vga_top.v`):** Wraps the sub-modules and utilizes combinational logic to output a test pattern using 12-bit Hexadecimal color codes (e.g., `12'hF00` for pure Red).

## Directory Structure
```text
VGA_Sync_Generator/
├── src/                # Verilog hardware modules
│   ├── clk_div.v
│   ├── h_counter.v
│   ├── v_counter.v
│   ├── vga_sync.v
│   └── vga_top.v
├── sim/                # Testbench files
│   └── vga_top_tb.v
└── README.md
```
## Simulation & Verification
The timing logic was fully verified using **Xilinx Vivado Behavioral Simulation**. The testbench asserts a system reset, drives the 100MHz clock, and successfully verifies the staggered blanking and synchronization pulses.

![VGA Simulation Waveforms](vga_simulation_waveform.png)