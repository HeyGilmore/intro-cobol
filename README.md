# Intro to COBOL

This repo is where I’m learning COBOL from scratch and tracking what I build, week by week.

---

## What is COBOL?

**COBOL (Common Business-Oriented Language)** is a programming language used for writing business application programs. It was created in **1959** to give businesses a standard way to write programs for:

- Finance  
- Government  
- Enterprise data processing  
- Transaction-heavy systems  

It was designed so that non-technical business people could *read and understand* what the programs do.

---

## What is COBOL used for?

COBOL is still used in **mission-critical systems** that handle huge amounts of data.

### 1. Banks & Financial Institutions

- ATM transactions  
- Credit card processing  
- Interest calculations  
- Ledger systems  
- Mainframe batch jobs  

### 2. Government Systems

- Social Security  
- IRS tax systems  
- Unemployment systems  
- DMV systems  
- Medicare / Medicaid  

### 3. Insurance Companies

- Claims processing  
- Premium calculations  
- Customer policy databases  

### 4. Large Enterprise Back-End Systems

- Mainframes  
- Legacy data  
- Batch processing  
- High-throughput databases  

---

## How COBOL is structured

Most COBOL programs are organized into four main divisions:

- **IDENTIFICATION DIVISION.** – Program name and metadata  
- **ENVIRONMENT DIVISION.** – System-related settings  
- **DATA DIVISION.** – Variables, records, and file definitions  
- **PROCEDURE DIVISION.** – The actual instructions (the “code” / logic)

---

## Week 1 – Basics

**Goal:** Get a working COBOL environment on macOS and write the first small programs.

### ✅ Completed

1. **Install a COBOL compiler on macOS**

   - Installed **GnuCOBOL** via Homebrew:  
     ```bash
     brew install gnu-cobol
     ```
   - Verified the install with:  
     ```bash
     cobc -v
     ```

2. **Set up VS Code for COBOL**

   - Installed COBOL extension:  
     - `bitlang.cobol` (COBOL + GnuCOBOL linter)
   - Using VS Code integrated terminal for compiling and running programs.

3. **Learned COBOL structure**

   - Wrote small programs using:
     - `IDENTIFICATION DIVISION.`
     - `DATA DIVISION.`
     - `PROCEDURE DIVISION.`

4. **Wrote first programs (folder: `001-basics/`)**

   - `hello.cob`  
     - Simple “Hello, COBOL World!” program.
   - `math.cob`  
     - Adds two hard-coded numbers and displays the result.
   - `math2.cob`  
     - Asks the user for two numbers and displays the sum.
   - `calculator.cob`  
     - Menu-based calculator (Add, Subtract, Multiply, Divide) that runs once.
   - `calculator2.cob`  
     - Improved calculator with a loop:
       - Shows a menu
       - Lets the user perform multiple operations
       - Option `5` exits with a “GOODBYE!” message

---

## How to compile and run (GnuCOBOL)

From inside one of the project folders (for example, `001-basics`):

```bash
# Compile
cobc -x calculator2.cob

# Run
./calculator2
