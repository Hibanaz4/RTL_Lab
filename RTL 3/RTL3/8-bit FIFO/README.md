
An 8-bit FIFO (First-In, First-Out) is a memory buffer that stores and retrieves data in the same order it is received. It has 8 memory locations, each storing 8-bit data. Data is written only when wr_en = 1 and the FIFO is not full, while data is read only when rd_en = 1 and the FIFO is not empty. The FIFO uses write and read pointers to access memory locations and a counter to track the number of stored data items. The full and empty signals prevent invalid write and read operations, respectively. On reset, the FIFO returns to its initial empty state.
## Features
- 8 × 8-bit memory array
- Separate read and write pointers
- Full and Empty status flag
- Testbench included for simulation
## Files
- `8bit_FIFO.sv` – FIFO design
- `8bit_FIFO_tb.sv` – Testbench for verification
-  Relevant images


 
