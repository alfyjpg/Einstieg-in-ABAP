*&---------------------------------------------------------------------*
*& Report Z_LEARN003_INTERNETABELLEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z_LEARN003_INTERNETABELLEN.


*Wir haben in ABAP 3 Arten von intere Tabellen:
*1. Standardtabellen
*2. Sortierte Tabellen
*3. Hash-Tabellen


*Wir können interne Tabellen in der folgenden Reihenfolge erstellen:


*1. Wir erstellen die Structure, die uns vorgibt, wie unsere Datensatz aussehen soll
TYPES structure type ZLEARN003_ART.

*2. Aus dieser Datensatzstruktur deklarieren wir eine Tabelle-strukture
 types: itab_structure type standard table of structure.

*3. Aus dieser Tabellen-Struktur initializieren wir eine Tabelle
  data itab type itab_structure.

*4. Nun nachdem wir die Datensatzstrukture erstellt haben, initializieren wir einen Datensatz.
data wa_satz type structure.



DATA: wa_db type zlearn003_ART.


"Wichtige Schlüsselwörte, die mit interne Tabellen arbeiten:

"Pass auf, normaleweise from, to, into und alle diese ergänzende Schlüsselwörte kommen in der 2ten Platz

*1. Append ---> To
*2. Insert ---> into  index  || insert - into table -
*3. Collect ---> into
*4. Delete ----> index | where .
*5. Read Tabel ---> into  ----> Musst auf jeden Fall Index || with Key (Key-Name) = value nutzen
*6. Modify (Genau wie bei OpenSQL Anweisung) ----> + Where, Index
*7. Delete Table ----> (Genau wie bei OpenSQL Anweisung)

" 1. Append
wa_satz-artikelnr = '10'.
wa_satz-kurztext = 'Hafer'.
wa_satz-verkpreis = '0.55'.

append wa_satz to itab.

"2. Insert

wa_satz-artikelnr = '55'.
wa_satz-kurztext = 'Körnige Käse'.
wa_satz-verkpreis = '2.49'.

insert wa_satz into table itab.


"1. Append nochmal um sicherzustellen

wa_satz-artikelnr = '33'.
wa_satz-kurztext = 'hamburger Vegam'.
wa_satz-verkpreis = '5.49'.

append wa_satz to itab.


"Ausgabe

*loop at itab into wa_satz.
*
*write: wa_satz-artikelnr, wa_satz-kurztext, wa_satz-verkpreis,/.
*
*endloop.

"2 insert

wa_satz-artikelnr = '55'.
wa_satz-kurztext = 'Körnige Käse'.
wa_satz-verkpreis = '4.49'.

insert wa_satz into itab index 4.


write : 'Before Collect',/.
loop at itab into wa_satz.

write: wa_satz-artikelnr, wa_satz-kurztext, wa_satz-verkpreis,/.

endloop.


"3.collect

collect wa_satz into itab.
write : 'After collect!',/.
loop at itab into wa_satz.

write: wa_satz-artikelnr, wa_satz-kurztext, wa_satz-verkpreis,/.
endloop.


"4. Delete
delete itab index 4.
write : 'After Delete!',/.
loop at itab into wa_satz.
write: wa_satz-artikelnr, wa_satz-kurztext, wa_satz-verkpreis,/.
endloop.


"5. Read table

write : 'Wa_satz before Read Tabel: ', wa_satz-artikelnr, wa_satz-kurztext, wa_satz-verkpreis,/.

Read table itab into wa_satz index 1.

write : 'Wa_satz after Read Tabel: ', wa_satz-artikelnr, wa_satz-kurztext, wa_satz-verkpreis,/.


clear: wa_satz, itab.


" Nun übertragen wir die Datensätze von der DB zu der Internen Tabelle. indem wir:

*1. Select anweisung über DB und dann in einer Workarea, die dann in internen Tabelle hinzugefügt
*2. Move-Corresponding von der DB-Workare zun internen Tablle-Workarea
*3. innerhalb die Select-Anweisung  into Corresponding field of table @tablename

"1. Durch Select anweisung
select * from zlearn003_ART into wa_db.
wa_satz-artikelnr = wa_db-artikelnr.
wa_satz-kurztext = wa_db-kurztext.
wa_satz-langtext = wa_db-langtext.
wa_satz-mwstklasse = wa_db-mwstklasse.
wa_satz-verkpreis = wa_db-verkpreis.

append wa_satz to itab.
ENDSELECT.

write :/ 'Hier ist die neue Übetragene Tabelle Methode 1:',/.

loop at itab into wa_satz.
 write :/ wa_satz-artikelnr, wa_satz-kurztext, wa_satz-verkpreis,/.
 ENDLOOp.

 clear: itab, wa_satz, wa_db.


"2. Durch Move-corresponding to
select * from zlearn003_ART into wa_db.

  move-CORRESPONDING wa_db to wa_satz.
 append wa_satz to itab.
  endselect.

  write :/ 'Hier ist die neue Übetragene Tabelle Methode 2:',/.

loop at itab into wa_satz.
 write :/ wa_satz-artikelnr, wa_satz-kurztext, wa_satz-verkpreis,/.
 ENDLOOp.

"3. Durch into Corresponding fields of table @itab

select * from zlearn003_ART into corresponding fields of table @itab.
  loop at itab into wa_satz.
    write :/ wa_satz-artikelnr, wa_satz-kurztext, wa_satz-verkpreis,/.
    ENDLOOP.





 "6. Modify:
    "1. modify - from - index -
    "2. modify - from - where -


read table itab into wa_satz index 5.

wa_satz-kurztext = 'Modify 6.1'.

"6.1

modify itab from wa_satz index 5.

if sy-subrc = 0.
  write '6.1 ist erfolgreich!'.
  else.
    write '6.1 ist nicht erfolgreich'.
ENDIF.

  loop at itab into wa_satz.
    write :/ wa_satz-artikelnr, wa_satz-kurztext, wa_satz-verkpreis,/.
    ENDLOOP.


    "Modify 6.2

    Read table itab into wa_satz with key artikelnr = '1'.

    wa_satz-kurztext ='Modify 6.2'.

 modify itab from wa_satz index 1.

    if sy-subrc = 0.
  write '6.2 ist erfolgreich!'.
  else.
    write '6.2 ist nicht erfolgreich'.
ENDIF.

  loop at itab into wa_satz.
    write :/ wa_satz-artikelnr, wa_satz-kurztext, wa_satz-verkpreis,/.
    ENDLOOP.


 " Delete Table


    Delete table itab from wa_satz.

     if sy-subrc = 0.
  write '7. Delete ist erfolgreich!'.
  else.
    write '7. Delete ist nicht erfolgreich'.
ENDIF.

 loop at itab into wa_satz.
    write :/ wa_satz-artikelnr, wa_satz-kurztext, wa_satz-verkpreis,/.
    ENDLOOP.



 " Wir können unsere Tabelle auch beschreiben bzw. ausgeben, wie viele Zeilen haben wir überhaupt.

    describe table itab lines data(itab_lines).

 write: / 'Anzahl der Zeile in unserer internen Tabelle ist: ', itab_lines.

 delete itab where artikelnr = '2'.

 data(number_lines) = lines( itab ). " Man muss abstand zwischen die Variable und die Klammern.

 write: / 'Anzahl der Zeile in unserer internen Tabelle ist: ', number_lines.



 " Sorted Tabelle:
write : 'Tabelle before  sortation'.

wa_satz-artikelnr = '99'.
wa_satz-kurztext = 'Text 99'.

insert wa_satz into itab index 2.

wa_satz-artikelnr = '88'.
wa_satz-kurztext = 'Text 88'.

insert wa_satz into itab index 3.

  loop at itab into wa_satz.
    write :/ wa_satz-artikelnr, wa_satz-kurztext, wa_satz-verkpreis,/.
    ENDLOOP.



write : 'Tabelle after sortation'.

 sort itab by artikelnr DESCENDING.

  loop at itab into wa_satz.
    write :/ wa_satz-artikelnr, wa_satz-kurztext, wa_satz-verkpreis,/.
    ENDLOOP.


    " Deleting adjecant duplicate from

    wa_satz-artikelnr = '88'.
wa_satz-kurztext = 'Text duplicate'.

insert wa_satz into itab index 5.

        write : 'Tabelle after deleting duplicates'.

      loop at itab into wa_satz.
    write :/ wa_satz-artikelnr, wa_satz-kurztext, wa_satz-verkpreis,/.
    ENDLOOP.


    delete adjacent duplicates from itab.

    write : 'Tabelle after deleting duplicates'.

  loop at itab into wa_satz.
    write :/ wa_satz-artikelnr, wa_satz-kurztext, wa_satz-verkpreis,/.
    ENDLOOP.
