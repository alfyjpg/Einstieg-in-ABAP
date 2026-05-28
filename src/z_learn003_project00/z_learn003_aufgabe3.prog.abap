*&---------------------------------------------------------------------*
*& Report Z_LEARN003_AUFGABE3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_learn003_aufgabe3.

PARAMETERS: number1 TYPE i default 10,
            number2 TYPE i,
            number3 TYPE i obligatory.

data result2 type p DECIMALS 5.





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
write : number1 , '+' , number2, '=', result.
new-line.

"/ DIV
result  = number1 DIV number3.
write : number1 , 'DIV' , number3, '=', result2.
new-line.

" MOD
result  = number1 mod number3.
write : number1 , 'mod' , number3, '=', result.
new-line.
