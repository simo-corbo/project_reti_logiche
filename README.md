# Logical Networks Project - Final Report

This repository contains the source code, documentation, and synthesis artifacts for a project focused on designing and implementing logical network components. The project was completed as part of the final coursework requirements for the Computer Engineering program at Politecnico di Milano.

## Project Overview

The primary objective of this project was to create a component capable of managing memory-based input/output operations efficiently using custom-designed finite state machines (FSMs). The system processes serialized input, extracts memory addresses, manages data channels, and interfaces with memory to store and retrieve data. The system supports features such as reset handling, simultaneous output of multiple channels, and the ability to handle rapid successive transmissions.

## Components and Architecture

The system is divided into two main components:

### 1. **DeSerialize Transform (DeSerT)**
This component is responsible for deserializing a serialized input signal into parallel outputs representing the data channel and memory address. The key features of this component include:
- A **Finite State Machine (FSM)** to control deserialization:
  - **RST**: Resets the system and stops input processing.
  - **WAIT_INPUT**: Waits for a valid input signal.
  - **GET_CH[1]** and **GET_CH[0]**: Reads the two bits representing the data channel.
  - **GET_ADDRESS**: Reads the memory address (up to 16 bits).
  - **SEND_INPUT**: Signals memory to retrieve data.
- An **output valid signal**, which is high for two clock cycles at the end of processing.
- The ability to handle inputs with variable address lengths (0 to 16 bits).

### 2. **DataSwitch**
This component manages communication with memory and maintains internal registers for the output data channels. Its key features include:
- A **Finite State Machine (FSM)** to control operations:
  - **RST**: Resets the internal registers and interrupts memory requests.
  - **WAIT_INPUT**: Waits for a valid signal from DeSerT.
  - **WAIT_DATA**: Waits for memory to provide data.
  - **SAVE**: Stores data in the appropriate channel register.
  - **SHOW**: Outputs the stored data for one clock cycle.
- Four 8-bit registers corresponding to output channels.
- A reset mechanism that initializes all registers and interrupts memory communication when necessary.

## Experimental Results

### Synthesis Summary
- The component was synthesized and tested successfully using Vivado.
- The design uses **58 Flip-Flops** and no latches.
- Synthesis artifacts and schematics are included in the repository under the `schematics` folder.

### Simulations
The following test scenarios were conducted to validate the component:
1. **Variable Address Lengths and Overwriting**  
   The system correctly processes inputs with address lengths of 0 and 16 bits, initializing unused registers to zero.
2. **Reset Handling**  
   The system was tested with resets occurring:
   - Before input processing begins.
   - During input processing.
   - After input processing but before memory retrieval.
   - After memory retrieval but before data output.
3. **Rapid Successive Transmissions**  
   Although the specification required a gap between transmissions, the design supports handling inputs separated by as few as 2 clock cycles.

## Key Features
- Processes serialized input into parallel output within **3 clock cycles** after transmission ends, significantly faster than the specified limit of 20 cycles.
- Robust handling of resets and invalid input scenarios.
- Efficient synthesis with minimal resource usage.

## Tools and Environment
- **Vivado**: Used for synthesis, simulation, and generating schematics.
- **HDL (Hardware Description Language)**: Used for component design and FSM implementation.

## Usage Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/username/logical-networks-project.git
   cd logical-networks-project```
2. Open the project in Vivado
3. Use the source files in the src folder to load the design.
4. Run simulations using the testbenches in the sim folder to verify functionality.
5. Refer to the docs/relazione.pdf for a detailed explanation of the design and results.
