### Day 1 Revision Notes: Verilog Fundamentals

* **Module Structure & Modeling Styles:** Reviewed the foundational syntax for Verilog modules and the three primary levels of abstraction: gate-level, dataflow, and behavioral modeling.
* **Data Types, Vectors, & Port Connections:** Refreshed the rules for assigning `wire` versus `reg` data types, declaring vector bit-widths (e.g., `[7:0]`), and safely instantiating sub-modules using explicit named port connections.
* **Procedural Logic & Control Flow:** Re-established the syntax for `always` blocks and how to correctly route logic using `if-else` conditions and `case` statements (crucial for state machines).
* **Assignments & The Event Scheduler:** Clarified the critical distinction between blocking (`=`) assignments for combinational logic and non-blocking (`<=`) assignments for sequential logic, and how the Verilog event scheduler processes them.
* **Testbench Architecture:** Recalled the standard syntax and structure for testbenches, including how to generate a simulated clock, apply stimulus using `initial` blocks, and test modules without physical hardware pins.

### Day 2 & 3 Revision: FSM Debugging & UART Timing

* **State Machine Verification:** Successfully mapped FSM state transitions to physical hardware waveforms, confirming UART LSB-first transmission logic (Start bit = 0, Stop bit = 1).
* **Testbench Initialization:** Resolved uninitialized `X` states by implementing correct active-high reset delays before applying stimulus.
* **Clock Domain Synchronization:** Fixed a critical timing mismatch where high-speed system clock pulses (10ns) were being missed by slow UART baud ticks. Learned to hold control signals high across baud boundaries so the slow FSM registers the command.