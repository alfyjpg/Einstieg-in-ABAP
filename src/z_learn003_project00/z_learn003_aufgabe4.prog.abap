*&---------------------------------------------------------------------*
*& Report Z_LEARN003_AUFGABE4
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_learn003_aufgabe4.

PARAMETERS: number1 TYPE i DEFAULT 10,
            number2 TYPE i,
            zeichen TYPE c.

DATA result2 TYPE p DECIMALS 2.

SELECTION-SCREEN COMMENT 50(70) TEXT-001.


IF number1 IS INITIAL OR number2 IS INITIAL.
  MESSAGE  'Die Eingabefelder dürfen nicht leer sein' TYPE 'E'.

ELSEIF zeichen IS INITIAL.
  MESSAGE  'Die Eingabefeld der Operation kann nicht leer bleiben' TYPE 'E'.

" Division — number2 darf nicht 0 sein
ELSEIF ( zeichen = 'D' OR zeichen = '/' ) AND number2 = 0.
  MESSAGE 'Division durch 0 ist nicht erlaubt!' TYPE 'E'.

else.

    " Case schreibt man aber ohne ''.
    " When aber schon mit ''.
    " Kleinigkeiten machen viele Unterschiede!

    CASE zeichen.
      WHEN '*'.
        DATA(result) = number1 * number2.
        WRITE : number1 , '*' , number2, '=', result.
      WHEN '+'.
        result = number1 + number2.
        WRITE : number1 , '+' , number2, '=', result.
      WHEN '-'.
        result = number1 - number2.
        WRITE : number1 , '-' , number2, '=', result.

        "Bei der Eingabe ist ABAP Case-Sensitive. Also m ist was anderes als M
      WHEN 'M'.
        result = number1 MOD number2.
        WRITE : number1 , 'MOD' , number2, '=', result.


      WHEN '/'.
        result2 = number1 / number2.
        WRITE : number1 , '/' , number2, '=', result2.

        "Inline-Deklaration um eine Variable von dem Type P zu deklarieren,
        "Während number1 und number2 vom Type i, erzeugt eine variable von dem
        "Type i und nicht p


      WHEN 'D'.
        result = number1 / number2.
        WRITE : number1 , '/' , number2, '=', result.


      WHEN OTHERS .
        MESSAGE 'Sie haben die falsche Operationzeichen eingegeben' TYPE 'E'.

    ENDCASE.
ENDIF.
