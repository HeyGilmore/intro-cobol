identification division.
program-id. MATH1. 

data division.
WORKING-STORAGE SECTION.
01 NUM1 PIC 9(3) VALUE 125.
01 NUM2 PIC 9(3) VALUE 275.
01 RESULT PIC 9(4). 

procedure division.
       ADD NUM1 TO NUM2 GIVING RESULT.
       DISPLAY "THE RESULT IS: " RESULT.

STOP run.
