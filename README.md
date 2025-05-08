![image](https://github.com/user-attachments/assets/35dd7ef7-e6c7-45d1-9cc2-055491fc00ba)# DESIGN-AND-IMPLEMENTATION-OF-AN-RISC-V-32-BIT-CORE-5-PIPELINE-WITH-C-AND-M-EXTENDSION-RV32IMC-
The 32-bit RISC-V architecture, particularly the RV32IMC variant, represents a milestone in open-source processor design, offering scalability, modularity, and efficiency

# 1.	Introduction
In modern computing, processor architecture plays a critical role in shaping the performance, energy efficiency, and adaptability of systems across diverse applications. The RISC-V Instruction Set Architecture (ISA) has emerged as a revolutionary standard in this field, offering an open-source, modular, and extensible platform for processor design. Unlike proprietary ISAs, RISC-V enables developers and researchers to customize architectures to meet specific requirements without being constrained by licensing costs or vendor lock-ins. This flexibility and scalability make RISC-V a compelling choice for building processors tailored to high-performance, low-power, and cost-sensitive applications.
This project aims to design and implement a 5-stage pipelined processor based on the RV32IMC variant of the RISC-V ISA. The RV32IMC architecture is a 32-bit implementation that includes the base integer instruction set (RV32I), the "M" extension for integer multiplication and division, and the "C" extension for compressed instructions. The inclusion of the "M" extension facilitates efficient execution of computationally intensive arithmetic operations, while the "C" extension reduces code size and improves instruction cache utilization by introducing compressed 16-bit instructions. Together, these features enable the development of high-performance processors optimized for embedded systems and resource-constrained environments.
The 5-stage pipelined architecture adopted in this project ensures efficient instruction processing by dividing execution into five sequential stages: Fetch, Decode, Execute, Memory, and Writeback. This approach allows multiple instructions to be processed concurrently, significantly enhancing throughput. The pipeline design is complemented by advanced mechanisms, including hazard detection units, forwarding logic, and branch prediction, to mitigate the impact of data, control, and structural hazards. These features ensure that the processor delivers high performance while maintaining functional correctness.
The project's overarching objective is to build a functional RV32IMC processor capable of executing a wide range of instructions efficiently, with a particular focus on real-world applicability. The design process includes simulation and verification stages to validate compliance with the RISC-V specification, functionality under various workloads, and performance metrics. The modular nature of the RV32IMC processor also positions it as a versatile platform for educational and research purposes, enabling future extensions and optimizations.
By leveraging the power of the RV32IMC architecture, this project highlights the potential of RISC-V to address the needs of modern computing systems. The combination of open-source principles, modular design, and advanced features like compressed instructions makes the RV32IMC an ideal choice for building efficient, scalable, and adaptable processors that can cater to diverse applications ranging from embedded devices to high-performance systems.

# Structure
![image](https://github.com/user-attachments/assets/578f5605-7d90-4148-8231-e3d49f1074d9)

# Specified Instructions of RISC-V
![image](https://github.com/user-attachments/assets/37ff0564-4a31-4ed9-aa01-630fcf9cd308)

# Overview of RV32I
The RV32I is the base integer instruction set for the RISC-V architecture, designed to operate on 32-bit data widths. As the foundational instruction set, RV32I provides all essential instructions for arithmetic, logic, memory access, and control flow needed for general-purpose computing. This simplicity and modularity make RV32I ideal for small, efficient processors, especially in embedded and IoT applications 

![image](https://github.com/user-attachments/assets/2af04d04-fe0d-4c53-bd3d-240cf1bed858)

This figure illustrates the six instruction formats utilized in the RISC-V architecture: R-type, I-type, S-type, SB-type, U-type, and UJ-type. Each format is optimized for specific operations, demonstrating the flexibility and efficiency of the instruction set. The R-type format is used for register-to-register operations and includes fields for two source registers (rs1, rs2), a destination register (rd), and function codes (funct3, funct7) to specify the operation, along with an opcode. The I-type format supports immediate values for operations such as arithmetic or memory access, incorporating a 12-bit immediate field (imm[11:0]) alongside rs1, rd, funct3, and opcode fields. The S-type format is used for memory store instructions, where the 12-bit immediate is split across imm[11:5] and imm[4:0]. Similarly, the SB-type format is used for conditional branch instructions, with the immediate field organized differently to facilitate efficient branching. The U-type format supports large immediate values, using a 20-bit imm[31:12] field, and is ideal for instructions requiring absolute address calculations. Lastly, the UJ-type format, designed for jump instructions, includes a 20-bit immediate field (imm[20:1, 11, 19:12]) to allow for large jump offsets. This modular and structured approach ensures that RISC-V maintains simplicity while accommodating various instruction requirements efficiently

# Listing of RV32I computational instructions.
![image](https://github.com/user-attachments/assets/c04fc6ec-4fbe-4e34-8dee-acb07918036a)

# ALU (Arithmetic and Logical Unit)
The Arithmetic Logic Unit (ALU) is a critical component of the datapath that performs arithmetic and logical operations. It takes two operands as input and produces one output based on the operation code (opcode) it receives from the control unit. The ALU can perform a variety of operations such as addition, subtraction, and bitwise operations like AND, OR, XOR, and shift operations
![image](https://github.com/user-attachments/assets/7dda1760-89e1-4248-9b7e-702dafad2ce5)

# Branch Unit
In the RV32I microarchitecture, the Branch unit is responsible for handling branch instructions, such as conditional and unconditional jumps. It evaluates the branch condition based on the comparison operations it performs and determines whether to take the branch or not by the flag, istaken, it outputs. If a branch is taken, the new program counter (PC) value is calculated in ALU based on the branch target address. This unit plays a crucial role in controlling the flow of execution within the processor.
![image](https://github.com/user-attachments/assets/dce51d0e-ddaf-4d54-b62f-1ed8829b7eb6)

# Hazard Unit
The Hazard Unit manages both control and data hazards in the pipelined processor. A data hazard happens when an instruction tries to read a register that hasn't been updated by a preceding instruction. A control hazard arises when the next instruction to be fetched hasn't been determined before the fetch takes place. To ensure the processor runs the program correctly, we enhanced it with a Hazard Unit that identifies and appropriately handles hazards.
Raw data hazards occur when an instruction depends on the result of a previous instruction that hasn't yet been written to the register file. These hazards can be resolved through forwarding if the result is computed in time, otherwise, the pipeline must stall until the result is available.
Control hazards happen when the decision on the next instruction to fetch hasn't been made by the time it needs to be fetched. These hazards can be addressed by stalling the pipeline until the decision is made or by predicting the next instruction and then flushing the pipeline if the prediction is wrong. The earlier the decision is made, the fewer instructions need to be flushed in case of a misprediction
![image](https://github.com/user-attachments/assets/51531368-d3d9-42df-a319-56c52d891cc4)
![image](https://github.com/user-attachments/assets/eeccb3b6-22fa-402c-ad67-31266f13aefc)

# Implementation of M-Extension for Integer Multiplication and Division
![image](https://github.com/user-attachments/assets/41ec80f2-fc3a-4eb2-ac5d-bfe83f684848)

# Multiplier
At first the choice of using an optimizing algorithm to implement the multiplication process was Booth’s Algorithm since Booth's Algorithm is an efficient technique used for performing binary multiplication. It reduces the number of additional operations performed, thereby optimizing the power. But since Booth’s Algorithm is used for singed operations and there are unsigned instructions such as mulhsu and mulhu, then we modified this algorithm to overcome this problem.
Steps of the algorithm:
1.	Initialization
-	Load the multiplier.
-	Clear the accumulator and carry registers.
-	Set the counter to 32 (for 32-bit multiplication).
2.	Iterative Multiplication in MUL State:
-	Check the LSB of the multiplier.
-	If 1, add the multiplicand to the accumulator, if 0, do nothing
-	Perform an arithmetic right shift on the combined registers {carry, accumulator, and multiplier}.
-	Decrement counter.
3.	Result
-	If the counter reaches 0, the result is in the combined accumulator and multiplier.
![image](https://github.com/user-attachments/assets/87450763-22a4-4851-8d84-afa12385e915)
![image](https://github.com/user-attachments/assets/f5e3fdcb-9a17-4456-bd55-620cb96e9fb7)

# Divider
Our divider is implemented based on the non-restoring algorithm for unsigned division. The non-restoring division algorithm is a method used in digital arithmetic to divide two binary numbers. It is particularly efficient for hardware implementations because it avoids the need for restoring the partial remainder to a positive value after each subtraction operation. The non-restoring division algorithm reduces the number of arithmetic operations needed compared to other division methods, making it faster for hardware implementation.
![image](https://github.com/user-attachments/assets/95041c69-17e9-4450-acf1-24f6e6e2a60d)

Steps of the algorithm:
1.	In this step, the corresponding values are initialized in the registers as follows: register A is set to 0, register M holds the Divisor, register Q contains the Dividend, and N specifies the number of bits in the Dividend.
2.	In this step, we will check the sign bit of A.
3.	If the bit in register A is 1, shift the combined value of AQ to the left and perform the operation A = A + M. If the bit is 0, shift the combined value of AQ to the left and perform the operation A = A - M. In the case of 0, this involves adding the 2's complement of M to register A, with the result stored in A.
4.	check the sign bit of A again.
5.	If the bit in register A is 1, then Q[0] will be set to 0. If the bit is 0, then Q[0] will be set to 1. Here, Q[0] refers to the least significant bit of Q.
6.	Then, the value of N, which serves as a counter, will be decremented.
7.	If the value of N = 0, then we will go to the next step. Otherwise, we must again go to step 2.
8.	If the sign bit of register A is 1, we will execute A = A + M.
9.	In this step, register A holds the remainder, and register Q contains the quotient.

# M-Controller
Its primary role is to ensure efficient and accurate execution of M-Extension instructions by coordinating the necessary control signals and handling data flow within the processor. The controller optimizes performance by implementing fast paths for simple operations (fast operations). This contributes to the overall performance and functionality of the RISC-V core, enhancing its ability to handle computationally intensive tasks.
Figure 18 represents the finite state machine of the controller block which have four states:
•	IDLE
•	MUL: Performs Multiplication
•	DIV: Performs Division
•	FAST: Performs Fast Operations
![image](https://github.com/user-attachments/assets/25a273b9-2b71-464b-8ac5-25a42b081591)

# Waveform

# Fetch Stage
![image](https://github.com/user-attachments/assets/6e04afe6-3fd4-440f-ac2c-ab27d18d864c)

# Decode Stage
![image](https://github.com/user-attachments/assets/2b709344-341e-4b52-a0fb-9612ab01e3a5)

# Decode to Execute
![image](https://github.com/user-attachments/assets/a88e62af-7bcf-4630-8bc4-534a90fddcc2)

# Execute Stage
![image](https://github.com/user-attachments/assets/5195afeb-9732-4588-bf3d-25f5b3101203)

# ALU
![image](https://github.com/user-attachments/assets/ce515453-bb4a-48b0-b002-ca613974cbad)

# Forwarding Block
![image](https://github.com/user-attachments/assets/a6718e59-e558-4a90-9a7f-eb74b7f15442)

# Memory Stage
![image](https://github.com/user-attachments/assets/90eb5f96-3b09-4b7b-bb38-990c209f3fe8)

# Wriback Stage
![image](https://github.com/user-attachments/assets/9436ea6d-63e8-4432-b73c-a66dc2788c4a)

# R-type.
![image](https://github.com/user-attachments/assets/504d419f-678d-4c7b-957d-46d00084111b)

# I-type.
![image](https://github.com/user-attachments/assets/3d33b6d2-8555-4736-832e-3140ea398076)

# S-type.
![image](https://github.com/user-attachments/assets/51a546a2-8850-410d-9a5b-615a7dae99b8)

# U-type.
![image](https://github.com/user-attachments/assets/35bf0b0e-058e-4ca3-9002-0ccc53141066)

# FPGA Implementation and Application

# Synthesis Reports

# Timing Report
![image](https://github.com/user-attachments/assets/91739553-0549-4b6a-8675-3cfd68f1829a)

# Power Report
![image](https://github.com/user-attachments/assets/ec2c6e23-2645-4ab5-ab1d-df25633e17d9)

# Utilization Report
![image](https://github.com/user-attachments/assets/b93f274b-b9c5-40b9-899a-8ca328490359)

# Application
  # Application 1: Sending Characters using UART
  ![image](https://github.com/user-attachments/assets/4ae032dc-a4f3-4751-bcc0-5396a503ca66)

  # Application 2: LEDs Testing
  ![image](https://github.com/user-attachments/assets/97b0fa1f-e176-4062-b025-5bf70e533720)

# Conclusion
In conclusion, we have demonstrated the development of a RISC-V core with the IMC extensions and an integrated cache system capable of running Linux-OS. The project illustrates the potential and versatility of RISC-V architecture and its capability in meeting modern computing environment while maintaining efficient performance.
The implementation of the IMC extensions has enhanced the core capabilities and functionality making it capable of handling high-speed mathematical computations and atomic memory operations. Level-1 cache has been crucial for improving the throughput and reducing the latency of memory access ensuring high efficiency. Privileged architecture has been important also for supporting Linux-OS and handling exceptions and interrupts.
Through testing and verification, the developed RISC-V core has demonstrated the ability to achieve the desired functionality. The successful implementation of this project provides a foundation for future research and development, where more extensions, enhanced performance, and integration into larger systems can be explored.
This project shows a significant contribution to the field of computer architecture by showcasing the capability of utilizing RISC-V cores for complex systems.
In summary, the project's outcomes emphasize the viability of RISC-V as a competitive alternative in the realm of modern computing, encouraging further exploration and adoption in diverse applications.
