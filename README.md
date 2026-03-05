# LILLIPUT Decoder Notebooks (Stim + PyMatching)

This repo contains a set of Jupyter notebooks used to prototype and evaluate a **LILLIPUT-style LUT decoder** workflow using **Stim** and **PyMatching**, and to generate LUT files for **Vivado/FPGA simulation**.

---

## Contents (Notebooks)

### 1) `LILLIPUT-without-sliding-window.ipynb`  ✅ (Base / starting point)
- This is the **initial (base) notebook** you should start with.
- It provides the main baseline results and pipeline.
- In experiments, this approach achieves around **0–2% logical error rate** for **1% phenomenological error** (relative comparison noted against the sliding-window attempt).

### 2) `LILLIPUT-with-sliding-window.ipynb`  ⚠️ (Unoptimized / failed trial)
- This is an **unoptimized trial / failed approach** toward a more faithful paper-style sliding-window implementation.
- It performs significantly worse in current form: about **4–8% logical error** for **1% phenomenological error**.
- Kept here mainly for reference / future improvement.

### 3) `LILLIPUT_round_weight_table.ipynb`  📊 (Comparison table generator)
- Generates a **comparison table** where:
  - **Rows = QEC rounds**
  - **Columns = `max_weights`**
- Useful for scanning performance trends across different QEC cycle counts and syndrome weight caps.
- Requires an additional dependency (`reportlab`) to export/render the table.

### 4) `gen_lut.ipynb`  🧠➡️🧾 (Vivado LUT + test vectors generator)
Generates the memory initialization files needed for LUT-based decoding in Vivado:
- **`lut_synd.mem`** — LUT syndromes (packed, typically hex lines)
- **`lut_out.mem`** — LUT output bits (one per entry)
- **`tb_vectors.mem`** — Testbench vectors: simulated **1000 observations** to be corrected, used to verify LUT correction results in simulation.

---

## Dependencies

### Core dependencies (needed for all notebooks)
Install:
- `stim`
- `pymatching`

Python stdlib modules used (no install needed in normal Python):
- `itertools`
- `collections`

> Note: `itertools` and `collections` are part of Python’s standard library, so you typically **do not install them separately**.

### Extra dependency (only for `LILLIPUT_round_weight_table.ipynb`)
- `reportlab`

---

## Installation

Recommended (pip):

```bash
pip install stim pymatching
pip install reportlab
