# Traffic Light 

This project implements a **Traffic Light Signal** using a **Moore Finite State Machine (FSM)** in SystemVerilog. The controller cycles through three traffic light states: **Red**, **Yellow**, and **Green**. On each clock cycle, the FSM transitions to the next state in the sequence **Red → Yellow → Green → Red**, ensuring only one light is active at a time.

