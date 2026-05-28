*&---------------------------------------------------------------------*
*& Report Z_LEARN003_AUFGABE1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z_LEARN003_AUFGABE1.

"Slim-Calc

write :  '=================================='.
new-line.
write :  'Slim Calc - Taschenrechner'.
new-LINE.
write:  'Benutzer: ', sy-uname.
new-line.
write:  'Datum ', sy-datum.
new-line.
write : / '=================================='.

"The Difference between new-line and / in a write statment
"1. new-Line wirkt ja so genau wie man beim Word shift + enter druckt
"2. / wirkt auch genau so wie beim Word, als ob man genau enter druckt

"Andere schreibweise mit position


skip 10.

write : 20 '=================================='.
new-line.
write : 20 'Slim Calc - Taschenrechner'.
new-LINE.
write: 20 'Benutzer: ', sy-uname.
new-line.
write: 20 'Datum ', sy-datum.
new-line.
write : /20 '=================================='.


skip 10.

write : 20 '=================================='.
new-line.
write : 20 'Slim Calc - Taschenrechner'.
new-LINE.
write: 20 'Benutzer: ', sy-uname.
new-line.
write: 20 'Datum ', sy-datum.
new-line.
write : /20 '=================================='.
