*&---------------------------------------------------------------------*
*& Report Z_LEARN003_STRING_VERGLEICH
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_learn003_string_vergleich.

"Jede Operator hat seine Gegenteil. Z.B.

"     Explanation for every Keyword:
"   CO (Contains only)           -      CN (Contains not only)  || ---> CO means if the word contains this specific Zeichenkette in it. Which means if just one letter is different, then the whole thing is false
"   CA (Contains Any)            -      NA (Contains not any)   || ---> CA means if the word contains any of these Letters in the String
"   CS (Contains String)         -      CS (Contains not String) || ---> CS Here we are judging based on the word itself.
"   CP (Contains Pattern)        -      NP (Contains not Pattern) || ---> Here we are judging based on the patterns. where * means (either 0 or many) and + means (just only one letter)


*Side                        What goes
*thereLeft         sideThe variable/string you want to
*checkRight        sideThe set of characters or pattern you are checking against
* That basically mean, that we are comparing the right side to the left side


" CO Contains Only (NUR diese Zeichen erlaubt)
* We judge based on, if all the left letters exist on the right side or n't

IF '12345b' CO '0123456789'.
  WRITE : 'True'.
ELSE.
  WRITE 'False'.
ENDIF.
ULINE.


"Contains Any (mind. eines der Zeichen)
* We judge based on, if any the left letters exist on the right side or n't (Even if it was only one)

IF '12345b' CA 'abcdefg'.
  WRITE : 'True'.
ELSE.
  WRITE 'False'.
ENDIF.
ULINE.


" CS — Contains String (Substring-Suche)
" We judge based on, if any the left words/texts exist on the right side or n't

IF 'Hello Word' CA 'Z'.
  WRITE : 'True'.
ELSE.
  WRITE 'False'.
ENDIF.
ULINE.


* CP - Contains Pattern
* * means contains this letter either 0, 1 or many times
* + means exactly 1 letter no more no less

IF 'Hello' CP 'H*'.
  WRITE : 'True'.
ELSE.
  WRITE 'False'.
ENDIF.
ULINE.

IF 'Hello' CP '*lo'.
  WRITE : 'True'.
ELSE.
  WRITE 'False'.
ENDIF.
ULINE.


IF 'Hello' CP 'H+llo'.
  WRITE : 'True'.
ELSE.
  WRITE 'False'.
ENDIF.
ULINE.
