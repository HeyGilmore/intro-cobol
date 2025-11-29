       IDENTIFICATION DIVISION. 
       PROGRAM-ID. PAYCHECK1.
       AUTHOR. HEYGILMORE.
       INSTALLATION PERSONAL COMP/ INTRO-COBOL.
       DATE-WRITTEN. 2025-11-29.
       DATE-COMPILED. 2025-11-29.
       SECURITY. "INTERNAL USE ONLY".
       REMARKS. "SIMPLE PAYCHECK CALCULATOR FOR PRACTICE".

        data division.
        working-storage section.
        01  EMP-NAME        PIC A(20).
        01  HOURS-WORKED    PIC 9(3).
        01  HOURLY-RATE     PIC 9(3).
        01  GROSS-PAY       PIC 9(5).
        01  REGULAR-PAY     PIC 9(5).
        01  OVERTIME-HRS    PIC 9(3).
        01  OVERTIME-PAY    PIC 9(5).
        01  OVERTIME-BONUS  PIC 9(5).
        01  DISP-GROSS-PAY  PIC $$$$9.


        PROCEDURE DIVISION.
           DISPLAY "Enter Employee name: ".
           accept EMP-NAME.

           DISPLAY "Enter hours worked (0-160): ".
           Accept HOURS-WORKED

           DISPLAY "Enter hourly rate (whole dollars): ".
           ACCEPT HOURLY-RATE.

      
           

            IF HOURS-WORKED > 40
               *> Regular pay: 40 hours at normal rate
               MULTIPLY 40 BY HOURLY-RATE
                    GIVING REGULAR-PAY
               *> Overtime hours = total hours - 40
               SUBTRACT 40 FROM HOURS-WORKED
                    GIVING OVERTIME-HRS
               *> Base overtime pay (1x rate)
               MULTIPLY OVERTIME-HRS BY HOURLY-RATE
                    GIVING OVERTIME-PAY
               *> Extra 0.5x part of overtime (half of base)
               DIVIDE OVERTIME-PAY BY 2
                    GIVING OVERTIME-BONUS
               *> Gross pay = regular + base overtime + bonus
               ADD REGULAR-PAY TO OVERTIME-PAY
                    GIVING GROSS-PAY
               ADD OVERTIME-BONUS TO GROSS-PAY
                    GIVING GROSS-PAY
           ELSE
               MULTIPLY HOURS-WORKED BY HOURLY-RATE
                    GIVING GROSS-PAY
           END-IF.

           MOVE GROSS-PAY TO DISP-GROSS-PAY.


           DISPLAY "EMPLOYEE: " EMP-NAME.
           DISPLAY "HOURS WORKED: " HOURS-WORKED.
           DISPLAY "HOURLY RATE: " HOURLY-RATE.
           DISPLAY "GROSS PAY: " DISP-GROSS-PAY.

           STOP RUN. 
       
