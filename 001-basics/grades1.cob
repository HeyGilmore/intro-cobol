       IDENTIFICATION DIVISION. 
       PROGRAM-ID. GRADES1.

       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       01 STUDENT-NAME   PIC A(20).
       01 SCORE1         PIC 9(3).
       01 SCORE2         PIC 9(3).
       01 SCORE3         PIC 9(3).
       01 TOTAL-SCORE    PIC 9(4).
       01 AVERAGE-SCORE  PIC 9(3).
       01 LETTER-GRADE   PIC 9(1).
       01 MESSAGE01      PIC X(4)  VALUE "FAIL".

       PROCEDURE DIVISION.
           DISPLAY "Enter studen name: ".
           ACCEPT STUDENT-NAME.

           DISPLAY "Enter first score (0-100): ".
           ACCEPT SCORE1.

           DISPLAY "Enter second score (0-100): ".
           ACCEPT SCORE2.

           DISPLAY "Enter third score (0-100): ".
           ACCEPT SCORE3.

      *    Formula to gather everage
           ADD SCORE1 TO SCORE2 GIVING TOTAL-SCORE.
           ADD SCORE3 TO TOTAL-SCORE GIVING TOTAL-SCORE.

           DIVIDE TOTAL-SCORE BY 3 GIVING AVERAGE-SCORE.

           EVALUATE TRUE 
           WHEN AVERAGE-SCORE >= 90
                MOVE "A" TO LETTER-GRADE 
                MOVE "PASS" TO MESSAGE01
           WHEN AVERAGE-SCORE >= 80
                MOVE "B" TO LETTER-GRADE
                MOVE "PASS" TO MESSAGE01  
           WHEN AVERAGE-SCORE >= 70
                MOVE "C" TO LETTER-GRADE
                MOVE "PASS" TO MESSAGE01  
           WHEN AVERAGE-SCORE >= 60
                MOVE "D" TO LETTER-GRADE 
           WHEN OTHER  
                MOVE "F" TO LETTER-GRADE 
           END-EVALUATE.

           DISPLAY "Student: " STUDENT-NAME.
           DISPLAY "Average score: " AVERAGE-SCORE.
           DISPLAY "Letter grade: " LETTER-GRADE.
           DISPLAY "Status: " MESSAGE01.

           STOP RUN.
