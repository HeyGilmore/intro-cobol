identification division.
program-id. CALC1.

data division.
working-storage section.
01 NUM1 PIC 9(3).
01 NUM2 PIC 9(3).
01 RESULT PIC zzz9.
01 CHOICE PIC 9.

procedure division.
       DISPLAY "Simple COBOL Calculator".
       DISPLAY "1. Add".
       DISPLAY "2. Subtract".
       DISPLAY "3. Multiply".
       DISPLAY "4. Divide".
       DISPLAY "Choose an option (1-4): ".
       ACCEPT CHOICE.

       DISPLAY "Enter First Number: ".
       ACCEPT NUM1.
       DISPLAY "Enter Second Number: ".
       ACCEPT NUM2.

       evaluate CHOICE
           WHEN 1
               ADD NUM1 TO num2 giving RESULT
           WHEN 2
               subtract NUM2 from NUM1 giving RESULT
           WHEN 3
               MULTIPLY NUM1 by NUM2 giving RESULT
           WHEN 4
               divide NUM1 by NUM2 giving RESULT
           WHEN other
               DISPLAY "Invalid Choice"
           end-evaluate.

       display "Result: " RESULT.
       STOP RUN
