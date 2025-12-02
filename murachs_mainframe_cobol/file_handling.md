
# Foundation of COBOL file handling

By This you would know 
    - What is a SELECT Statement is
    - What an FD statement is
    - How COBOL connects a logical file name -> A real OS file
    - How COBOL knows the structure of each record in a file. 


## What are Select Statement?
When a COBOL program works with any file, it must first **declare the file** in the ENVIRONMENT DIVISION.

You can do that with a **Select sttatement**

```COBOL

SELECT CUSTMAST ASSIGN TO AS-CUSTMAST.
SELECT SALESRPT ASSIGN TO SALESRPT.

```

CUSTMAST is the COBOL name of the customer master file
AS-CUSTMAST is the system file name (OS-level name)

The first name is used inside your program
The second name tells COBOL which actual file on disk to use

## Select Statements on Mainframes

```COBOL

SELECT CUSTMAST ASSIGN TO AS-CUSTMAST.

```

The **ASSIGN TO** name is called a ddname
a ddname connects your program's file to a real disk/printer

Rules for a ddname: 
    - 1-8 Characters
    - Letter or digits only 
    - usually uppercase
    - often same as file-name for simplicity

## VSAM VS NON-VSAM 
- VSAM -> A newer IBM storage format
- Non-VSAM -> traditional sequential files

Both types use Select Statements

## Print Files and Spooling
**Spooling**
The process includes:
    - It doesn’t print immediately
    - It writes each line into a temporary disk file
    - Later a printer picks it up

## What is FD Statement?
FD = File Description
- This appears in the **Data Division**

Example of FD from the book:
```COBOL

FD CUSTMAST.

01 CUSTOMER-MASTER-RECORD.
   05 CM-BRANCH-NUMBER     PIC 9(2).
   05 CM-SALESPER-NUMBER   PIC 9(2).
   05 CM-CUSTOMER-NUMBER   PIC 9(5).
   05 CM-CUSTOMER-NAME     PIC X(20).
   05 CM-SALES-THIS-YTD    PIC S9(5)V99.
   05 CM-SALES-LAST-YTD    PIC S9(5)V99.


```
What this does:
- Defines the structure of each record
- Lists every field
- Specifies the exact number of characters in each field
- Must match the layout of the file on disk


## Record Contains Clause
Optional in FD

If you skip it:
- COBOL adds all PIC sizes and determines record size automatically
- Most programmers don’t include this clause
- But it’s useful when debugging mismatched file sizes


## FD for print files
Print files have much simpler FD descriptions:

```COBOL
FD SALESRPT.

01 PRINT-AREA PIC X(132).

```
You build the line in Working-Storage and then write it.

## Simple way to remember
Connect my COBOL file name to a real file
```COBOL
SELCT MUSTMAST ASSIGN TO AS-CUSTMAST
```

Describe what each record in this file looks like
```COBOL
FD CUSTMAST.
01 CUSTOMER-MASTER-RECORD.
   05 CM-BRANCH-NUMBER PIC 9(2).
   ...
```

Every printed line is one big string:
```COBOL
FD SALESRPT.
01 PRINT-AREA PIC X(132).
```
