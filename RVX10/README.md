# RISC-V Single-Cycle Processor with RVX10 Extensions

This project implements a **single-cycle RISC-V processor** extended with 10 custom RVX10 instructions  
while keeping the hardware modifications minimal.

---

## Thought Process & Design Approach

My primary goal was to **add new instructions without large hardware changes**.

### 1. ALU Control Width
- Observed that 15 total instructions require 4 bits for ALU control.  
- **Change:** `ALUControl[2:0]` → `ALUControl[3:0]`  
- Files updated: `riscvsingle`, `controller`, and `aludecoder`.
- Screenshots:  
  ![ALUControl Change 1](https://github.com/user-attachments/assets/62a484af-1455-401a-b8cf-ee7e0dbbbf24)  
  ![ALUControl Change 2](https://github.com/user-attachments/assets/0be2b7bb-3e3c-430c-bcc6-8d79521a7364)  
  ![ALUControl Change 3](https://github.com/user-attachments/assets/61efdee8-800a-4bfe-8acf-839c6e1e84ca)

### 2. ALU Update
- Extended the ALU based on the assignment’s pseudo-code,  
  but preserved the base ALU design.  
- ![ALU Base Update Screenshot](https://github.com/user-attachments/assets/37222970-3ef1-448f-b3bf-f9efc01994be)

### 3. funct7_2b Signal
- Introduced a `funct7_2b` signal since the **first two bits of `funct7`** determine the new opcode `0x0B` (R-type).
- Added this signal to **controller** and **aludecoder**.
- Screenshots:  
  ![funct7_2b 1](https://github.com/user-attachments/assets/dfc27208-9312-4e1d-8ec0-6c28ace14792)  
  ![funct7_2b 2](https://github.com/user-attachments/assets/f97c7bfa-4ee2-4f62-ae9f-13b03e41dea7)

### 4. Main Decoder
- Added a new R-type operand following the existing R-type structure.
- Only ALU op changed to `2'b11`.
- ![Main Decoder Screenshot](https://github.com/user-attachments/assets/3d179b70-f940-464f-9c39-efebb3cc5141)

### 5. ALU Decoder
- Wrote the logic for `ALUOp = 2'b11` to handle all RVX10 instructions.
- ![ALU Decoder Case Screenshot](https://github.com/user-attachments/assets/50249cac-290c-4e09-9ec1-07a6a3014fda)

### 6. Register (x0) Protection
- To avoid writes to `x0`, added a simple condition:
  ```verilog
  if (we & a3 != 0) rf[a3] <= wd;
