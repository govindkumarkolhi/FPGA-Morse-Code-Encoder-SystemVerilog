# FPGA-Based Morse Code Communication System

A SystemVerilog-based FPGA implementation of a Morse Code Communication System developed as part of the **Digital System Design Lab Chip Design Training @ GIKI**. The project encodes decimal digits (0–9) into Morse code and displays the encoded output through an LED on the Digilent Nexys A7 FPGA board.

The design is implemented using a Finite State Machine (FSM) and verified through simulation in ModelSim before hardware deployment on the FPGA.

---

## Features

- Morse code encoding for decimal digits (0–9)
- Finite State Machine (FSM) based implementation
- Two operating modes:
  - **Phase 1:** Single-digit Morse encoder
  - **Phase 2:** Multi-digit encoder supporting up to six stored digits
- FIFO-based storage for multi-digit transmission
- Accurate Morse timing for dots, dashes, and gaps
- Functional verification using SystemVerilog testbenches
- Hardware implementation on the Digilent Nexys A7 FPGA board

---

## Hardware

- Digilent Nexys A7 FPGA Development Board

## Software

- SystemVerilog
- Vivado
- ModelSim

---

# Project Overview

## Phase 1 – Single Digit Morse Encoder

In Phase 1, the system reads a single decimal digit from the FPGA switches when **BTN1** is pressed. The selected digit is translated into its corresponding Morse code sequence and displayed through the onboard LED.

### Morse Timing

- Dot (.) → LED ON for 1 second
- Dash (-) → LED ON for 3 seconds
- Gap between Morse elements → LED OFF for 0.5 second

The transmission automatically returns to the idle state after all five Morse symbols have been transmitted.

---

## Phase 2 – Multi-Digit Morse Encoder

Phase 2 extends the functionality by allowing the user to store a sequence of up to six digits before transmission.

### Operation

1. Enable Number Mode.
2. Enter a digit using the switches.
3. Press **BTN1** to store the digit.
4. Repeat until all desired digits are stored.
5. Press **BTN2** to begin transmission.

The stored digits are transmitted sequentially in Morse code with a **2-second gap** between consecutive digits. After transmission is complete, the FIFO buffer is automatically cleared for the next sequence.

---

# Design Methodology

The project is implemented using a Finite State Machine (FSM) to control the Morse code transmission.

The FSM manages:

- Idle state
- LED ON duration (dot or dash)
- Inter-element OFF duration
- Inter-digit gap (Phase 2)
- Automatic completion of transmission

A lookup table is used to map decimal digits (0–9) to their corresponding Morse code representations, while counters generate the required timing delays.

---

# Repository Structure

```

FPGA-Morse-Code-Encoder-SystemVerilog
│
├── README.md
├── LICENSE
├── .gitignore
│
├── src/
│   ├── phase1_morse_encoder.sv
│   ├── tb_phase1_morse_encoder.sv
│   ├── phase2_multi_digit_encoder.sv
│   └── tb_phase2_multi_digit_encoder.sv
│
├── constraints/
│   └── NexysA7.xdc
│
├── docs/
│   └── Morse_Code_Communication_System_Report.pdf
│
├── images/
│   ├── phase1_waveform.png
│   └── phase2_waveform.png
│
└── demo/
└── FPGA_Demonstration.mp4

```

---

# Simulation Results

## Phase 1 Waveform

![Phase 1 Simulation](images/phase1_waveform.png)

The simulation verifies correct Morse code generation for multiple input digits, including proper LED ON durations for dots and dashes, along with the required OFF intervals.

---

## Phase 2 Waveform

![Phase 2 Simulation](images/phase2_waveform.png)

The simulation demonstrates successful storage of multiple digits, sequential Morse code transmission, and the required 2-second gap between consecutive digits.

---

# FPGA Demonstration

A hardware demonstration of the project running on the Digilent Nexys A7 FPGA board is available below.

📹 **Demo Video**

```

demo/FPGA_Demonstration.mp4

```

---

# Future Improvements

- Support alphabetic Morse code (A–Z)
- Configurable transmission speed
- UART-based message transmission
- Seven-segment display integration
- PS/2 keyboard input
- LCD/OLED output support

---

# Author

**Govind Kumar**

Bachelor of Electrical Engineering

Institute of Space Technology (IST), Pakistan

---

# License

This project is licensed under the MIT License.
```

