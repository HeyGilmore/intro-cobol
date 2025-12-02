       IDENTIFICATION DIVISION.
       PROGRAM-ID. DECIMALS1.
       AUTHOR.     HEYGILMORE.
       DATE-WRITTEN. 2025-12-01.
      ** Decimal playground for PIC 9(3)V99 and ZZ9.99.

       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
      * Internal number with implied decimal (123.45)
       01 AMOUNT-INTERNAL  PIC 9(3)V99 VALUE 123.45.
      * DIPSLAY VERSION WITH VISIBLE DECIMAL POINT
       01 AMOUNT-DISPLAY   PIC ZZ9.99.


       PROCEDURE DIVISION.
           DISPLAY "Internal stored value: ".
           DISPLAY AMOUNT-INTERNAL.

           MOVE AMOUNT-INTERNAL TO AMOUNT-DISPLAY.

           DISPLAY "formatted amount (with decimals): ".
           DISPLAY AMOUNT-DISPLAY.

           STOP RUN.
