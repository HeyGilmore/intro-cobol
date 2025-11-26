identification division.
program-id. CALC2.

data division.
working-storage section.
01 NUM1   PIC 9(3).
01 NUM2   PIC 9(3).
01 RESULT PIC ZZZ9.
01 CHOICE PIC 9 VALUE 0.

procedure division.
       PERFORM UNTIL CHOICE = 5
           DISPLAY "=========="
           DISPLAY "--- Simple COBOL Calculator ---"
           DISPLAY "=========="
           DISPLAY "1. Add"
           DISPLAY "2. Subtract"
           DISPLAY "3. Multiply"
           DISPLAY "4. Divide"
           DISPLAY "5. Exit"
           DISPLAY "Choose an option (1-5): "
           ACCEPT CHOICE

           *>    Condition if they dont choose 5
           IF CHOICE NOT = 5
               DISPLAY "Enter First Number"
               accept NUM1

               DISPLAY "Enter Second Number"
               accept NUM2

           *>    IF STATEMENT for CHOICE between 1-5
               EVALUATE CHOICE
                   WHEN 1
                       ADD NUM1 TO NUM2 GIVING RESULT
                   WHEN 2
                       SUBTRACT NUM2 FROM NUM1 GIVING RESULT
                   WHEN 3
                       multiply NUM1 BY NUM2 giving RESULT
                   WHEN 4
                       divide NUM1 by NUM2 giving RESULT
                   WHEN other
                       DISPLAY "Invalid Choice."
               END-EVALUATE

           *>    Display Results
               DISPLAY "Result: " RESULT
               DISPLAY " "
           ELSE    
               DISPLAY "GOODBYE!"
           END-IF
       END-PERFORM

       STOP RUN.
