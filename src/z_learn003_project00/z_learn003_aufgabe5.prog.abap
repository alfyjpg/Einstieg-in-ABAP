*&---------------------------------------------------------------------*
*& Report Z_LEARN003_AUFGABE5
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*

* "Wir müssen hier auch stop einbetten
" Wir müssen auch die Art von While schleife einbetten bzw.
*abapDATA: flag TYPE c LENGTH 1.
*
*flag = 'X'.   " = TRUE
*flag = ' '.   " = FALSE (space)
*
*Option 2 – abap_bool (modern ABAP)
*abapDATA: flag TYPE abap_bool.
*
*flag = abap_true.   " = 'X'
*flag = abap_false.  " = ' '
*
*abapDATA: flag TYPE i.
*
*flag = 1.   " = TRUE
*flag = 0.   " = FALSE
"Sehr wichtig zu lernen, wie man das ganze in While Schleife einbettet

REPORT z_learn003_aufgabe5.

PARAMETERS: zahl1    TYPE i,
            zahl2    TYPE i,
            schleife TYPE c.

SELECTION-SCREEN COMMENT 50(50) TEXT-001.

DATA(counter) = 1.
DATA(result) = 0.
DATA miniresult TYPE p DECIMALS 7.

IF zahl1 IS INITIAL OR zahl2 IS INITIAL OR schleife IS INITIAL .
  MESSAGE 'Die Eingabefeldern dürfen nicht leer sein' TYPE 'E'.
ELSEIF zahl1 <= 0 OR zahl2 <= 0.
  MESSAGE 'Die Eingabefelder dürfen nicht kleiner gleich 0 sein' TYPE 'E'.
ELSE.

  CASE schleife.
    WHEN 'M'.

      DO 10 TIMES.


        result = zahl1 * counter.
        WRITE : result, '=' , zahl1, '*', counter.
        NEW-LINE.
        counter = counter + 1.
      ENDDO.

      " Continue springt nur die Runde
      " Exit lässt das Programm komplett verlassen
      " Stop hört sich mit der Schleife auf.

    WHEN 'G'.
      DO 10 TIMES.
        result = zahl1 * counter.
        IF result MOD 2 <> 0.
          counter = counter + 1.
          CONTINUE.
        ELSE.
          WRITE : result, '= ', zahl1, '*', counter.
          counter = counter + 1.
          NEW-LINE.


        ENDIF.
      ENDDO.


    WHEN 'T'.


     result = zahl2.

  while result >= 1.
     miniresult = result / zahl1.
     write : / miniresult, '=', result, '/', zahl1.
     result = miniresult.
     ENDWHILE.
     when others.
      MESSAGE 'Bitte ein gültiges Zeichen!' TYPE 'E'.
  ENDCASE.
ENDIF.
