# COBOL Report-Preparation Basics  
Section 1 — Understanding Report Specifications

## What Is a Report in COBOL?
COBOL was designed for business reporting. Companies used it to generate large printed reports such as:

- Customer lists  
- Account statements  
- Payroll reports  
- Monthly summaries  
- Tax reports  

Before writing any code, a COBOL programmer must plan **exactly how the printed report will look on paper**.

### The Report Specification Defines:
- What column each piece of text begins in  
- How wide each field is  
- How many lines are printed per page  
- Where headings and labels appear  

---

## What Is a Print Chart?
A **print chart** is a blueprint for your report.  
It’s a grid showing exactly where each character, heading, and data field should print.

```cobol

Print Chart Example
----1----2----3----4----5----6----7----8----9----
DATE: 99/99/9999 PAGE: ZZZ
CUST NUMBER CUSTOMER NAME SALES

```

Each dash represents one character position.  
The print chart controls alignment, width, spacing, and formatting.

---

## Why Does COBOL Need a Print Chart?
COBOL was created in the 1960s, when printers had **fixed formats**:

- Every printed line was **132 characters wide**  
- Every printed page had **66 lines**  
- Top few lines were blank margins  
- The rest were used for data and headings  

Because of this, COBOL needs **precise control**:

- A name field might be exactly 20 characters  
- A number field might be exactly 7 characters  
- A heading must start in the exact correct column  

Everything is intentionally rigid so the output lines up perfectly.

---

## COBOL Number Formats in Print Charts
Print charts often use formatting patterns to show how numbers should be printed.

Patterns include:

- `99999` → plain 5-digit number  
- `ZZ,ZZZ.99` → number with commas and decimals  
- `VALUE` → literal text (prints exactly as written)

These patterns tell COBOL how to **display** data on the printed report.

---

## Page Length Explained
Traditional mainframe printers printed:

- **132 characters per line**
- **66 lines per page**
  - ~6 top margin lines
  - ~60 usable lines for the report body

In this chapter’s example:

- **55 customer lines** are printed per page  
- **Plus heading lines at the top**  

Total printable lines on a page:

55 customer lines
6 heading lines
= 61 lines printed each page


The program must:

- Start a new page after 55 customer lines  
- Reprint the heading lines on each new page  

---

## Printed Output Is a File in COBOL
In COBOL:

- A printed line is treated just like a record in a data file  
- Each printed line becomes **one record** in the print-file  
- COBOL writes lines into the print-file first  
- The operating system later sends the file to the printer  

Printing a line is done with:

```cobol

WRITE PRINT-AREA.

```

This writes one full line (typically 132 characters).

---

## Simple Real-World Example

```COBOL

DATE: 01/26/2005           SALES REPORT         PAGE: 1

CUST   NAME                   SALES
11111  ABC COMPANY            12,345.67
22222  XYZ CORP               22,222.22

```

Behind the scenes, COBOL:
- Writes each printed line as a 132-character record
- Tracks how many lines have been printed
- Starts a new page after 55 lines
- Prints headings again on each new page
- Formats the numbers using masks (e.g., ZZ,ZZZ.99)
