An APB (Advanced Peripheral Bus) Slave is a peripheral device in the ARM AMBA architecture that communicates with an APB Master. It performs read and write operations on internal memory using APB control signals.
These are the standard APB signals commonly used.
•	PCLK – Clock signal 
•	PRESETn – Active-low reset 
•	PSEL – Slave select 
•	PENABLE – Transfer enable 
•	PWRITE – Read/Write control 
•	PADDR – Address bus 
•	PWDATA – Write data bus 
•	PRDATA – Read data bus 
•	PREADY – Transfer complete/ready signal

TestBench:
The testbench acts as the APB Master by generating the required signals for the APB Slave. It first resets the slave, then initiates write operations to store data in memory, followed by read operations to retrieve the stored data. The master controls the communication sequence and verifies that the slave responds correctly.

## Waveform
<img width="1332" height="357" alt="APB Waveform" src="https://github.com/user-attachments/assets/38ed89ac-a085-46bd-aee7-17135cf248d8" />
 ## Schematic Diagram
 <img width="720" height="921" alt="APB schematic diagram" src="https://github.com/user-attachments/assets/46a31b0f-c64b-4258-882a-f321ad6f327e" />
