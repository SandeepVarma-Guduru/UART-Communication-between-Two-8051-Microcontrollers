# UART Communication between Two 8051 Microcontrollers

## Overview

This project demonstrates **serial communication (UART)** between two **8051 microcontrollers** using Assembly language.

The transmitter continuously sends the ASCII character **'A'** over the UART interface at **9600 baud**. The receiver receives the transmitted character and displays it on a **16×2 LCD**.

This project demonstrates the fundamentals of UART communication, LCD interfacing, timer configuration, and Assembly programming for the 8051 microcontroller.

---

## Features

- UART Serial Communication
- 8051 Assembly Programming
- Timer-1 Configuration for Baud Rate Generation
- 9600 bps Communication
- LCD Interfacing (16×2 HD44780)
- Continuous Data Transmission
- Real-Time Character Display
- Polling-Based UART Communication

---

## Hardware Requirements

- 2 × AT89C51 / 8051 Microcontrollers
- 16×2 LCD Display
- MAX232 Serial Interface (for RS-232 communication, if required)
- 11.0592 MHz Crystal Oscillator
- Capacitors
- Power Supply (5V)
- Connecting Wires

---

## Software Requirements

- Keil µVision (Assembler)
- Proteus Design Suite (Simulation)

---

## Project Working

### Transmitter

1. Configures Timer-1 in Mode 2 (8-bit Auto Reload).
2. Generates a baud rate of **9600 bps**.
3. Initializes the UART in Mode 1.
4. Continuously transmits the ASCII character **'A'** through the serial port.
5. Waits until transmission is complete before sending the next character.

---

### Receiver

1. Configures Timer-1 for UART communication.
2. Initializes the serial port at **9600 bps**.
3. Initializes the 16×2 LCD.
4. Waits for incoming serial data.
5. Reads the received character from the UART buffer.
6. Displays the received character on the LCD.
7. Continuously repeats the process.

---

## UART Configuration

| Parameter | Value |
|-----------|-------|
| Communication Mode | UART Mode 1 |
| Baud Rate | 9600 bps |
| Data Bits | 8 |
| Stop Bits | 1 |
| Timer Used | Timer-1 |
| Timer Mode | Mode 2 (8-bit Auto Reload) |

---

## LCD Connections

| LCD Pin | 8051 Pin |
|----------|----------|
| D0–D7 | Port 2 |
| RS | P3.3 |
| RW | P3.4 |
| EN | P3.5 |

---

## Program Flow

```
                TRANSMITTER

      Initialize UART
             │
             ▼
      Configure Timer-1
             │
             ▼
      Send Character 'A'
             │
             ▼
   Wait Until Transmission Completes
             │
             ▼
          Repeat Forever
```

```
                  RECEIVER

        Initialize UART
               │
               ▼
        Initialize LCD
               │
               ▼
      Wait for Incoming Data
               │
               ▼
      Read Character from SBUF
               │
               ▼
      Display Character on LCD
               │
               ▼
          Repeat Forever
```

---

## Skills Demonstrated

- 8051 Assembly Programming
- UART Serial Communication
- Embedded Systems
- LCD Interfacing
- Timer Programming
- Polling Technique
- Serial Data Transmission
- Serial Data Reception
- Register-Level Programming
- Embedded Firmware Development
- Keil µVision
- Proteus Simulation

---

## Applications

- Serial Communication Systems
- Embedded Device Communication
- Industrial Automation
- Data Logging Systems
- Embedded Monitoring Systems
- Sensor Data Transmission
- Microcontroller Communication

---

## Future Improvements

- Transmit complete strings instead of a single character.
- Implement interrupt-based UART communication.
- Add error detection and checksum verification.
- Support bidirectional communication.
- Integrate wireless modules such as Bluetooth or ZigBee.
- Display complete messages with scrolling on the LCD.

---

## Repository Structure

```
8051-UART-Communication
│
├── Transmitter
│   └── transmitter.asm
│
├── Receiver
│   └── receiver.asm
│
├── Proteus
│   ├── UART_Communication.pdsprj
│   └── Simulation Files
│
├── Images
│   ├── Circuit.png
│   ├── Transmitter.png
│   ├── Receiver.png
│
├── README.md
│
└── LICENSE
```

---

## Learning Outcomes

Through this project, the following embedded systems concepts were implemented:

- UART initialization using SCON
- Baud rate generation using Timer-1
- Serial transmission using SBUF
- Serial reception using RI flag
- Transmission completion using TI flag
- LCD interfacing using 8-bit mode
- Polling-based embedded programming
- Assembly language programming on the 8051 microcontroller

---

## Author

**Guduru Sandeep Varma**

B.Tech – Electronics and Communication Engineering

Indian Institute of Information Technology Kottayam

---

## License

This project is developed for educational and learning purposes.
