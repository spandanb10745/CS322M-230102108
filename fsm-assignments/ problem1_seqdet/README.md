# Serial Pattern Detector (Mealy FSM) — Detect `1101` with Overlap

## Goal
Design and verify a Mealy FSM that detects the serial bit pattern `1101` on input `din` with overlap.  
The output `y` generates a **1-cycle pulse** when the last bit (`1`) of the sequence arrives.

- **FSM Type**: Mealy  
- **Reset**: Synchronous, active-high  

---

## State Diagram
- Labeled states represent progress through the pattern.  
- Transitions handle overlaps (e.g., `1101101` still triggers detections).  
- Output `y=1` only when full pattern `1101` is detected.  

*(Insert your FSM diagram image here, e.g., `docs/state_diagram.png`)*

---

## Waveform
The testbench generates serial input streams on `din`.  
- `y` pulses high for **1 clock cycle** whenever `1101` is detected.  
- Overlaps are supported: e.g., input `1101101` gives **two pulses**.  

*(Insert annotated waveform screenshot here, e.g., `docs/waveform.png`)*

## How to Run (Vivado)

1. Open Vivado and create a new project:

---2. Add the source files:
- `seq_detect_mealy.v`  
- `tb_seq_detect_mealy.v`
3. Set the simulation top module to `tb_seq_detect_mealy`.
4. Run **Behavioral Simulation**.
5. Open the **waveform viewer** to verify detection pulses.

---

## Expected Behavior
| Input Stream (`din`) | Detection Pulses (`y`) |
|-----------------------|-------------------------|
| `1101`               | Pulse at last bit       |
| `1101101`            | Two pulses (overlap)    |
| `11101`              | Pulse when last `1` arrives |
| `01101101`           | Two pulse               |

---

## GitHub Submission
- **Repo URL**: *[(https://github.com/spandanb10745/CS322M-230102108)]*  
- **Final Commit Hash**: *[replace with latest commit hash]*  

---

## Author
- Name: *SPANDAN BHARADWAJ*  
- Course/Assignment: *CS_322_M*  



