identification division. 
program-id. MATH2. 

data division. 
working-storage section. 
01 NUM1 PIC 9(3).
01 NUM2 PIC 9(3).
01 RESULT PIC 9(4).

procedure division.
       display "enter first number: ".
       ACCEPT NUM1.

       display "Enter Second Number: ".
       ACCEPT NUM2.

       ADD NUM1 to NUM2 giving RESULT.

       display "The result is: " RESULT.
       
Stop run
