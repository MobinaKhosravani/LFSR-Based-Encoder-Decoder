# LFSR-Based Encoder/Decoder

**Course:** Digital Logic, Sharif University of Technology — 2024  
**Contributors:**  
- Mobina Khosravani — 402101628  
- MohammadAmin QareAghaji Asl — 402170505  

---

## Project Overview
This project implements a **Linear Feedback Shift Register (LFSR)** based **encoder and decoder system** in Verilog. It demonstrates the design of a simple digital communication system capable of encoding and decoding serial data using an LFSR-generated pseudo-random sequence.

The system includes:

- **15-bit LFSR Module:** Generates a maximal-length pseudo-random sequence with a configurable seed.
- **Encoder Module:** XORs the input data with the LFSR output to produce encoded data.
- **Decoder Module:** Uses the same LFSR sequence to recover the original data from the encoded input.
- **Top Module:** Connects the encoder and decoder for full system simulation.

---

## Key Features
- Implements a **15-bit LFSR** for pseudo-random sequence generation.  
- Supports configurable **seed/header** values to initialize the LFSR.  
- Encoder and decoder work synchronously to ensure correct data recovery.  
- Handles edge cases where the LFSR may reach zero by resetting to a non-zero state.  
- Suitable for FPGA or ASIC implementation as a learning project for digital communication and logic design.

---

## Usage
1. Simulate the `Top_EncoderDecoder` module with a clock and reset signal.  
2. Provide input data and LFSR headers for encoding/decoding.  
3. Observe the `encoded_out` and `decoded_out` signals to verify correctness.  

---

## Learning Outcomes
- Practical experience with **Verilog HDL** and digital design simulation.  
- Understanding of **LFSR sequences**, **XOR-based encoding**, and synchronous data recovery.  
- Exposure to **digital communication concepts** such as pseudo-random sequence generation and data integrity.  

---

