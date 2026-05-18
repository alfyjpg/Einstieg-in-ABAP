*&---------------------------------------------------------------------*
*& Report Z_LEARN003_MODU1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z_LEARN003_MODU1.

" Eine Aufgabe, die man mit Hilfe von Subroutines bzw. Unterprogramme genutzt werden muss:

data wa_satz type zlearn003_art.
data itab type standard table of zlearn003_art.
data summe type p value '0' DECIMALS 2.

"1. Alle aktuelle Artikeln in einer interne Tabelle zu übertragen
*2. Zeigt alle Artikeln von der Liste an            → FORM display_Artikel
"3. Alle aktuelle Artikeln in einer interne Tabelle zu übertragen
*4. Sucht ein Artikeln per Nummer       → FORM search_Artikel
*5. Berechnet den Gesamtpreis       → FORM calculate_total
*6. Räumt am Ende auf               → FORM cleanup


"1. Alle aktuelle Artikeln in einer interne Tabelle zu übertragen
perform transfer_artikel using itab.


"2. Artikel aus der internen Tabellen aufzulisten.
perform display_artikel using itab.

"3. Datenbank Datensätze ausgeben
perform display_db.


"4. Nach einem Artikeln suche aber mit der Numemr
parameters: number type c.
perform artikel_suche using number.

"5. Berechnung der ganzen Summer der Artikeln
perform summe_berechnen using itab summe.

write :/ 'Summe' , summe.

"6. clear
perform clear_all.




" Unterprogramm 1

form transfer_artikel using itab_f type table.


  select * from zlearn003_art into table itab_f.
    if sy-subrc = 0.
      write 'Übertragung wurde erfolgreich gemacht'.
      new-line.
      else.
        write 'Fehler bei der Übertragung'.
ENDIF.
  ENDFORM.




" Unterprogramm 2
form display_artikel using itab_f type table.


write : /, 'Daten aus der TAB wird ausgeschildert:',/.

  loop at itab_f into wa_satz.

    write: wa_satz-artikelnr, wa_satz-kurztext, wa_satz-langtext, wa_satz-mwstklasse, wa_satz-verkpreis,/.
ENDLOOP.
  endform.



"Unterprogramme 3


form display_db.


write : 'Daten aus der DB wird ausgeschildert:',/.
  select * from zlearn003_ART into wa_satz.
     write: wa_satz-artikelnr, wa_satz-kurztext, wa_satz-langtext, wa_satz-mwstklasse, wa_satz-verkpreis,/.
     endselect.

  ENDFORM.


" Unterprogramm 4
  form artikel_suche using value(number).

   select single * from zlearn003_art into wa_satz
      where artikelnr = number.
      if sy-subrc = 0.
      write: wa_satz-artikelnr, wa_satz-kurztext, wa_satz-langtext, wa_satz-mwstklasse, wa_satz-verkpreis,/.
else.

  write : 'Es gibt keine Artikel mit solcher Nummer'.
  endif.
    endform.


   "Unterprogramm 5.

    form summe_berechnen using itab  summe.

loop at itab into wa_satz.
    summe  = summe + wa_satz-verkpreis.
  endloop.
        if sy-subrc = 0.
        write 'Summe wurde berechnet'.
else.
  write
  'Fehler bei der Summenberechnung'.
endif.

write :/ 'Summe' , summe.

    endform.



    "Unterprogramm 6

    form clear_all.

      clear: itab, wa_satz, summe.

      if sy-subrc = 0.
        write 'All clear'.
else.
  write
  'All ist nicht clear'.
endif.
      endform.
