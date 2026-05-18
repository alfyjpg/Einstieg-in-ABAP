*&---------------------------------------------------------------------*
*& Report Z_LEARN003_MODU3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z_LEARN003_MODU3.

data itab type standard table of zlearn003_ART.


*" Calling a subprogram from another programm
* perform display_db in PROGRAM Z_LEARN003_MODU1.
*
*
* "Calling another subrogramm form another Program
*
* perform transfer_artikel in program Z_LEARN003_MODU1 using itab.
* "Calling another subrogramm form another Program
*
*"Artikel aus der internen Tabellen aufzulisten.
*perform display_artikel in program Z_LEARN003_MODU1 using itab.



"Submiitting to another programm
* submit Z_LEARN003_MODU2.

" Calling another Programm with sending parameters
*submit Z_LEARN003_MODU2
*
*with vorname = 'Mohamed'
*with nachname = 'Elalfy'
*with age = 16
*
*via selection-screen .

"Calling another Programm with Parameters but without selection screen.

*submit Z_LEARN003_MODU2
*
*with vorname = 'Mohamed'
*with nachname = 'Elalfy'
*with age = 7.

"natürlich passiert gar nichts weil wir haben einfach das Selektionsbild noch nicht gestartet.

submit z_learn003_MODU2
with vorname ='Mohamed'
with nachname  = 'Elalfy'
with age = 7

via selection-screen and return.

"Solange wir keinen anderen Code nach her geschrieben haben, hat ds Programm keinen Zweck,
"um zurückzuspringen.
" Warum? weil kein Zweck ist.

write 'Programm ist gut zurückgesprungen'.
