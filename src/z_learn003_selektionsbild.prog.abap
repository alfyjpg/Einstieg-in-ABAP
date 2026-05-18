*&---------------------------------------------------------------------*
*& Report Z_LEARN003_SELEKTIONSBILD
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_learn003_selektionsbild.

" || Normale und einfache Parameter ||

PARAMETERS p1 TYPE string.


" || Wichtige Schlüsselwörte von Parameter: ||
* default
* obligatory
* value check -----> Nur im Bezug auf einen DDIC
* lower case

PARAMETERS p2 TYPE String DEFAULT 'Max Mustermann' OBLIGATORY  LOWER CASE.


" Man kann auch Checkbox durch parameterS definieren



" || Checkbox ||
PARAMETERS box AS CHECKBOX.

" Checkbox hat den Type C und falls es eingecheckt ist dann value ist 'X'.
"Nicht eingecheckt ' '.

"Wollen wir sicherstellen, dass die Box eingecheckt ist? dann
"Einsatz 1

IF box IS INITIAL.
  WRITE 'Box is nicht eingechekt1'.
ELSE.
  WRITE 'Box ist eingecheckt1'.
ENDIF.

"Ansatz 2.
IF box = abap_true.
  WRITE 'Box ist eingecheckt2'.
ELSEIF box = abap_false.
  WRITE 'Box is nicht eingechekt2'.
ENDIF.


"Ansatz 3
IF box = ' '.
  WRITE 'Box ist nicht eingecheckt!3'.
ELSEIF box = 'X'.
  WRITE 'Box ist eingechekt3'.
ENDIF.


" || Radiobutton ||

PARAMETERS: rd1 RADIOBUTTON GROUP news,
            rd2 RADIOBUTTON GROUP news,
            rd3 RADIOBUTTON GROUP news.

"Man prüft auch die Radiobuttons, ob die eingecheckt oder nicht sind, genaue wie oben bei Checkbox.


"============================================================================================================
"============================================================================================================

" Rest finden sie im programm Z_LEARN003_SELEKTIONSBILD.

write text-001.
*
*if box is not initial.
*leave to TRANSACTION 'Z_LEARN003_SELEKTIONSBILD2'.
*endif.
