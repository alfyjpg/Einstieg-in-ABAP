*&---------------------------------------------------------------------*
*& Report Z_LEARN003_AUFGABE2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z_LEARN003_AUFGABE2.



DATA number1 type i value 10.
constants number2 type i value 5.
data number3 type i value 3.
data result2 type p DECIMALS 5.


"Jetzt führen wir die Grundart von Operationen
"Leider ABAP erlaubt keine direkte Berechnung innerhalb der Write-Anweisung.
"D.h. Wir müssen die Berechnung zurerst in einer externen Variable einlagern


" +
data(result)  = number1 + number2.
write : number1 , '+' , number2, '=', result.
new-line.

" *
result = number1 * number2.
write : number1 , '*' , number2, '=', result.
new-line.

" -
result  = number1 - number2.
write : number1 , '-' , number2, '=', result.
new-line.

" /
result2  = number1 / number2.
write : number1 , '/' , number2, '=', result2.
new-line.

" DIV
result  = number1 DIV number3.
write : number1 , 'DIV' , number3, '=', result.
new-line.


" MOD
result  = number1 mod number3.
write : number1 , 'mod' , number3, '=', result.
new-line.


"Der unterschied zwischen DIV und / ist:
"1. DIV Gibt eine ganze Zahl als Result
"2. / gibt das Ergebnis mit Nachkommezahlen raus
