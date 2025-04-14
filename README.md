# 🧪 Four-Port Switch Project

This repository contains labs for building a **SystemVerilog Testbench** to verify a Four-Port Switch module. The project walks through various Object-Oriented Programming (OOP) and Verification Methodology concepts, from basic class definitions to advanced testbench architectures.

---

## 📂 Repository Structure

Each lab file builds on the previous one, progressively adding more complexity to the verification components.

---

## 🔍 Overview

The Four-Port Switch is a digital module that receives packets on any of its four input ports and forwards them to the appropriate output port based on the destination address. These labs guide you through designing a full-featured testbench using **SystemVerilog**, culminating in a reusable and modular verification environment.

---

## 🧱 Labs Breakdown

### ✅ Lab 1: Simple Data Class Declaration
📄 `lab1.sv`  
Defines a basic **`packet`** class representing data structure elements such as source, destination, and payload. This introduces class syntax, constructors, and member variables in SystemVerilog.

---

### 🎲 Lab 2: Simple Randomization and Constraints
📄 `lab2.sv`  
Enhances the packet class with **randomization**. Introduces constraints to generate valid packet values. Perfect for generating diverse test scenarios.

---

### ⚙️ Lab 3: Static Properties and Methods *(Optional)*
📄 `lab3.sv`  
Demonstrates the use of **static members** to share data between different instances or track global states like packet count or ID.

---

### 🧬 Lab 4: Inheritance and Polymorphism
📄 `lab4.sv`  
Introduces OOP concepts of **inheritance and polymorphism** using three child classes: `psingle`, `pmulticast`, and `pbroadcast`, which inherit from `packet`.

---

### 🧩 Lab 5: Component Hierarchy
📄 `lab5.sv`  
Builds a **component-based hierarchy**, modeling testbench elements like generator, driver, monitor, and DUT interface using SystemVerilog classes.

---

### 🧪 Lab 6: Completing the Verification Component
📄 `lab6.sv`  
Brings all components together, enabling simulation of the full testbench. Defines proper connections between generator, driver, and monitor using **mailboxes** and **virtual interfaces**.

---

### 📝 Lab 7: Logging Monitor Output to File
📄 `lab7.sv`  
Final lab focuses on **logging monitor outputs** (like received packets or error messages) into a text file for post-simulation analysis using `$fopen`, `$fdisplay`, and `$fclose`.

---

## 💡 Key Concepts Covered
- Class-based Testbench Design
- Randomization & Constraints
- Inheritance and Polymorphism
- Component-based Hierarchies
- Mailbox Communication
- File I/O in SystemVerilog
- Reusability and Modularity

---

## 📌 How to Run
Make sure you have a simulator like **QuestaSim**, **ModelSim**, or **VCS**. Then, from the project directory:

```bash
vlog lab1.sv
vsim -c work.lab1 -do "run -all; quit"
