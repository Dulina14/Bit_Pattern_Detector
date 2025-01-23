# Bit Pattern Detector

This project serves as my introduction to FPGA programming, Verilog, test benches, and simulations. To make the learning process more engaging and practical, I designed a **bit pattern identifier system** as the core application.  

## Project Includes:
- A **sequence detector** capable of identifying a specific bit pattern.
- A **sequence generator** to produce test patterns for simulation and verification.
- Manually designed **Finite State Machine (FSM)** as a Mealy machine, including:
  - **State transition table** and **excitation table**.
  - Karnaugh maps for outputs and flip-flop inputs, leading to derived **combinational logic expressions** for implementation.
- Verilog code for the detector and its test benches to simulate its behavior.
- Simulation results to verify the detector's accuracy in identifying the desired pattern.

