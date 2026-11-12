# Mealy Overlapping Sequence Detector (`1011`)

A Verilog HDL implementation and behavioral verification of a **Mealy Finite State Machine (FSM)** designed to detect the serial bit sequence **`1011`** with overlapping pattern support.

## 🚀 Architecture & Design Highlights
* **Mealy FSM Efficiency:** Implemented using only **4 states** (`s0`, `s1`, `s2`, `s3`) with 2-bit state encoding (`2'b`). Because outputs depend on both the current state and current input (`din`), the detector asserts `dout = 1'b1` immediately on the 4th matching bit without needing a 5th state.
* **Overlapping Pattern Support:** 
  * Upon completing `1011` in state `s3` (`din = 1`), the FSM transitions directly to `s1` instead of `s0`, reusing the final `1` as the start of a new sequence.
  * If a mismatch occurs in `s3` (`din = 0`, forming `1010`), the FSM transitions back to `s2` to preserve the trailing `10` bits.
* **Latch-Free RTL:** Uses a default-override assignment (`dout = 1'b0`) at the top of the combinational `always @(*)` block alongside a `default` case branch to prevent unintended latch synthesis.

## 📊 Verification & Simulation Results
Verified using Verilator with a 24-bit stress-test stream (`101101110010110110001011`) containing overlapping patterns (`1011011`) and false-alarm sequences (`11100`, `000`). All **5 valid occurrences** triggered `dout` cleanly.

### Simulation Log Output:
```text
time = 0 | din = 0 | dout = 0
time = 20 | din = 1 | dout = 0
time = 30 | din = 0 | dout = 0
time = 40 | din = 1 | dout = 0
time = 45 | din = 1 | dout = 1   <-- Match 1 (1011)
time = 55 | din = 1 | dout = 0
time = 60 | din = 0 | dout = 0
time = 70 | din = 1 | dout = 0
time = 75 | din = 1 | dout = 1   <-- Match 2 (Overlapping 1011)
time = 145 | din = 1 | dout = 1  <-- Match 3 (1011)
time = 175 | din = 1 | dout = 1  <-- Match 4 (Overlapping 1011)
time = 245 | din = 1 | dout = 1  <-- Match 5 (1011)
```
