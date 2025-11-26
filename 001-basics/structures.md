

# COBOL Program Structure

COBOL programs are divided into **four main divisions**:

1. **IDENTIFICATION DIVISION** – the cover page (metadata)
2. **ENVIRONMENT DIVISION** – where and how the program runs
3. **DATA DIVISION** – all the data the program uses
4. **PROCEDURE DIVISION** – the actual instructions / logic


## 1. Identification Division

**What it is:**  
The “cover page” of the program — just metadata.  

**What it does:**

- Identifies the program.
- Optionally records author, date written, security info, etc.


**Example:**

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLO-WORLD.
       AUTHOR. NICHOLAS GILMORE.
       DATE-WRITTEN. 2025-11-26.
```

**Key Points:**
- PROGRAM-ID. – **required** in classic COBOL. It names your program.
- AUTHOR., DATE-WRITTEN., etc. – optional but common for documentation.
- No logic here — just descriptions.

## 2. Environment Division

**What it is:**  
Describes **where and how** the program runs.

**What it does:**

- Describes the computer environment (especially on mainframes).
- Defines how the program connects to external files and devices.

```cobol
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
           SOURCE-COMPUTER. IBM-Z.
           OBJECT-COMPUTER. IBM-Z.

       INPUT-OUTPUT SECTION.
           FILE-CONTROL.
               SELECT CUSTOMER-FILE
                   ASSIGN TO 'CUSTOMER.DAT'
                   ORGANIZATION IS LINE SEQUENTIAL.
```

**Key parts:**

- CONFIGURATION SECTION
    - Older style; describes the computer.
    - Often very simple or even omitted in modern compilers.
- INPUT-OUTPUT SECTION → FILE-CONTROL
    - Tells COBOL which files your program uses and what they’re called.
    - SELECT ... ASSIGN TO ... connects a logical file name (like CUSTOMER-FILE) to a physical file ('CUSTOMER.DAT' or a DDNAME).

> **Note (Beginner Tip):**  
> In beginner practice, you might not use this division much yet,  
> especially if you’re just doing simple `DISPLAY` / `ACCEPT` programs.


## 3. Data Division

**What it is:**  
Defines **all the data** the program works with.

**What it does:**

- Describes all the “stuff” the program uses:
  - Variables
  - File records
  - Working fields / temporary storage
- Provides detailed descriptions of input, output, and work files.

**Example:**

```cobol
       DATA DIVISION.

       FILE SECTION.
       FD  CUSTOMER-FILE.
       01  CUSTOMER-RECORD.
           05 CUSTOMER-ID        PIC 9(5).
           05 CUSTOMER-NAME      PIC X(30).

       WORKING-STORAGE SECTION.
       01  WS-TOTAL-CUSTOMERS    PIC 9(4) VALUE 0.
       01  WS-MESSAGE            PIC X(50).
```

### Main Sections in the DATA DIVISION

#### FILE SECTION

- Ties to `FILE-CONTROL` in the **ENVIRONMENT DIVISION**.
- Defines the **record layout** for each file:
  - What each line/record from the file looks like.
  - Which fields are in the record (ID, name, amount, etc.).

#### WORKING-STORAGE SECTION

- Where your regular variables live for the **whole run** of the program:
  - Counters  
  - Flags  
  - Strings/text  
  - Temporary values and calculations
- Think of this as the program’s **scratchpad / memory**.

---

### `PIC` (PICTURE) – How Data Looks and Behaves

In the **DATA DIVISION**, `PIC` (or `PICTURE`) defines:

- **Type** of data  
  - Numeric, text, edited/display format, etc.
- **Size**  
  - How many digits or characters.
- **Display format**  
  - How it should look when displayed (e.g., hide leading zeros).

**Examples:**

```cobol
       01  WS-NUMBER       PIC 9(4).      *> 4-digit number, 0000–9999
       01  WS-NAME         PIC X(20).     *> Text, up to 20 characters
       01  WS-DISPLAY-NUM  PIC ZZZ9.      *> Number, hide leading zeros
```

### Other DATA DIVISION Sections (Later Topics)

You’ll run into these as you go deeper into COBOL:

#### LOCAL-STORAGE SECTION

- Similar to `WORKING-STORAGE SECTION`.
- Variables are **reinitialized every time** the program is called.
- Good for data that should start “fresh” on each call.

#### LINKAGE SECTION

- Used when your program receives parameters from:
  - Another COBOL program (calling program)
  - An external caller
- Defines the layout of data that is **passed into** the program.

> 💡 **Beginner Tip:**  
> When starting out, you’ll mainly work with `WORKING-STORAGE SECTION` and simple `PIC` definitions for numbers and text.  
> `FILE SECTION`, `LOCAL-STORAGE SECTION`, and `LINKAGE SECTION` become more important as you start working with files and multi-program setups.


## 4. Procedure Division

**Mental model:**  
The actual instructions / logic – what the program does.

**Purpose:**

- Contains the executable code.
- Uses the data defined in the **DATA DIVISION**.
- Controls program flow: loops, conditions, calls, etc.

**Example:**

```cobol
       PROCEDURE DIVISION.
       MAIN-PARA.
           MOVE "HELLO, WORLD!" TO WS-MESSAGE
           DISPLAY WS-MESSAGE
           ADD 1 TO WS-TOTAL-CUSTOMERS
           DISPLAY "TOTAL: " WS-TOTAL-CUSTOMERS
           STOP RUN.
```

**Key concepts:**

- **Paragraphs / Sections**
  - Work like labels or blocks of code that group related statements.
  - `MAIN-PARA.` in the example is a paragraph name.

- **Statements**
  - Individual COBOL instructions, such as `MOVE`, `ADD`, `DISPLAY`, `IF`, `PERFORM`, etc.
  - In classic COBOL style, statements often end with a period for clarity.

- **Program Flow**
  - The PROCEDURE DIVISION controls the overall flow of the program.
  - You can think of it as the “recipe” that uses the ingredients defined in the **DATA DIVISION**.



#### The Full Program

`
       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLO-DEMO.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
           SOURCE-COMPUTER. IBM-Z.
           OBJECT-COMPUTER. IBM-Z.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-NAME         PIC X(20) VALUE SPACES.
       01  WS-MESSAGE      PIC X(50).

       PROCEDURE DIVISION.
       MAIN-PARA.
           MOVE "NICHOLAS" TO WS-NAME
           MOVE "HELLO, " TO WS-MESSAGE
           STRING WS-MESSAGE DELIMITED BY SIZE
                  WS-NAME     DELIMITED BY SPACE
              INTO WS-MESSAGE
           END-STRING
           DISPLAY WS-MESSAGE
           STOP RUN.
`
