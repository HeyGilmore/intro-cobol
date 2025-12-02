       IDENTIFICATION DIVISION. 
       PROGRAM-ID. PAYCHECK2.
       AUTHOR.     HEYGILMORE.
       DATE-WRITTEN. 2025-12-01.
      ** Paycheck-02 program with decimal hourly rate

       DATA DIVISION. 
       WORKING-STORAGE SECTION. 

       01 EMP-NAME             PIC A(20).
       01 HOURS-WORKED         PIC 9(3).

      * HOURLY RATE WITH 2 DECIMALS PLACES: (20.75)
       01 HOURLY-RATE          PIC 9(3)V99.
       
      * GROSS PAY WITH 2 DECIMAL PLACES: UP TO 999,999.99
       01 GROSS-PAY            PIC 9(6)V99.

      * DISPLAY VERSIONS
       01 DISPLAY-GROSS-PAY    PIC $$,$$9.99.
       01 DISPLAY-HOURLY-RATE  PIC $$9.99.

       PROCEDURE DIVISION.
           DISPLAY "Enter empoyee name: ".
           ACCEPT EMP-NAME.

           DISPLAY "Enter hours worked (0-160): ".
           ACCEPT HOURS-WORKED.

           DISPLAY "Enter hourly rate (20.75): ".
           ACCEPT HOURLY-RATE.

      *    Formula
           MULTIPLY HOURS-WORKED BY HOURLY-RATE GIVING GROSS-PAY.

      *    Moving internal numbers to External
           MOVE GROSS-PAY TO DISPLAY-GROSS-PAY.
           MOVE HOURLY-RATE TO DISPLAY-HOURLY-RATE.

           DISPLAY "EMPLOYEE: " EMP-NAME.
           DISPLAY "HOURS WORKED: " HOURS-WORKED.
           DISPLAY "HOURLY RATE: " DISPLAY-HOURLY-RATE.
           DISPLAY "GROSS PAY: " DISPLAY-GROSS-PAY.

           STOP RUN.
           
