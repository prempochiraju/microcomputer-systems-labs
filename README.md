# Microcomputer Systems Labs

![Lab Setup](https://github.com/user-attachments/assets/f0edf756-9650-4202-9277-ab765c7c81e2)

##  Overview

Teaching Assistant

This repository contains the embedded systems labs I designed and taught as a Teaching Assistant for Microcomputer Systems.

The work focuses on STM32 bare-metal programming and FreeRTOS, helping students understand low-level hardware interaction, real-time systems, and communication protocols by building systems from scratch.

---

- Bare-metal programming (register-level)
- GPIO, Timers, UART, SPI
- Interrupt handling (NVIC)
- Real-Time Operating Systems (FreeRTOS)
- Task scheduling and inter-task communication
- Embedded debugging and system design

---

## Hardware Used
- STM32 Nucleo-F401RE
- Sensors (ADXL345 Accelerometer)
- Push buttons, LEDs
- Breadboard + jumper wires

---

## 📂 Lab Projects

### 🔹 Lab 6: Timer Interrupts
- Configured TIM2 using registers
- Generated periodic interrupts
- Used NVIC for interrupt handling

---

### 🔹 Lab 7: UART Communication
- Implemented UART using register-level programming
- Transmitted and received data
- Used for debugging and communication

---

### 🔹 Lab 8: RTOS Queue-Based System
- Implemented FreeRTOS tasks
- Used message queues for communication
- Simulated real-time data processing

---

### 🔹 Lab 9: SPI Communication (Bare-Metal)
- Implemented SPI without HAL
- Configured SPI registers (CR1, SR, DR)
- Interfaced with ADXL345 sensor
- Demonstrated full-duplex communication

---

##  What I Learned
- How microcontrollers interact directly with hardware
- Importance of timing in embedded systems
- Difference between bare-metal and RTOS approaches
- Debugging real hardware issues

---

## Future Work
- Add I2C communication (sensor + LCD)
- Implement DMA for high-speed transfers
- Build complete embedded system projects
- Integrate with real-world applications

---

##  Author
Prem Swaroop  
Master’s in Computer Engineering – Florida Tech  

---
