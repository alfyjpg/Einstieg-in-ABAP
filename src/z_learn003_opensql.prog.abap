*&---------------------------------------------------------------------*
*& Report Z_LEARN003_OPENSQL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_learn003_opensql.


DATA wa_satz TYPE zlearn003_art.
DATA wa_satz2 TYPE zlearn003_art.

DATA wa_print TYPE zlearn003_art.

" For Insert
wa_satz-artikelnr = '1'.
wa_satz-kurztext ='Avocado' .
wa_satz-langtext = 'Avocado Hass '.
wa_satz-mwstklasse = '1'.
wa_satz-verkpreis = '3.99'.


" For Modify
wa_satz2-artikelnr = '2'.
wa_satz2-kurztext ='Milch' .
wa_satz2-langtext = 'Hafer Milch'.
wa_satz2-mwstklasse = '2'.
wa_satz2-verkpreis = '2.54'.



"Die wichtige OpenSQL Anweisungen meiner Mienung nach sind:
*
*insert -----> Es gibt 2 Variantern
* into - values
* from

*update -----> Es gibt auch 2 Varianten
* sets - where
* from

*modify ---> from   | Transporting.
*delete ---> from

" Mit Update, Modify und delete Anweisungen soll man tatsächlich where nutzen.


"Wenn man mit der Anweisung fertig, nutzt man COMMIT-Word oder ROllback.



" INSERT
INSERT INTO zlearn003_art VALUES wa_satz.



" loop at - into ---> internal tables
" select single * into ----> DBT

*SELECT * FROM zlearn003_ART INTO @wa_print.
*
*
*  WRITE : wa_print-artikelnr, wa_print-kurztext, wa_print-langtext, wa_print-mwstklasse, wa_print-verkpreis,/.
*
*ENDSELECT.


"Modify

* Als Insert

modify ZLEARN003_ART from wa_satz2.

SELECT * FROM zlearn003_ART INTO @wa_print.



  WRITE : wa_print-artikelnr, wa_print-kurztext, wa_print-langtext, wa_print-mwstklasse, wa_print-verkpreis,/.

ENDSELECT.

* Als Update

wa_satz2-kurztext = 'Kein Milch Mehr'.
wa_satz2-langtext = 'Kein Hafer Mehr'.

modify zlearn003_ART from @wa_satz2.
COMMIT WORK.

SELECT * FROM zlearn003_ART INTO @wa_print.



  WRITE : wa_print-artikelnr, wa_print-kurztext, wa_print-langtext, wa_print-mwstklasse, wa_print-verkpreis,/.

ENDSELECT.


" Delete

"delete through where

delete from zlearn003_ART where artikelnr = '2'.

SELECT * FROM zlearn003_ART INTO @wa_print.



  WRITE : wa_print-artikelnr, wa_print-kurztext, wa_print-langtext, wa_print-mwstklasse, wa_print-verkpreis,/.

ENDSELECT.


"Delete through workarea

delete zlearn003_ART from wa_satz.


SELECT single * FROM zlearn003_ART INTO @wa_print.
  if sy-subrc = 0.
  WRITE : wa_print-artikelnr, wa_print-kurztext, wa_print-langtext, wa_print-mwstklasse, wa_print-verkpreis,/.

elseif sy-subrc = 4.
  write: 'Keine Datensätze. Du hast die bestimmt schon gelöscht oder?'.
  endif.




write : '*************************The Update Anweisung************************',/.
  write : 'Reinserting the Data again',/.

  insert into zlearn003_art values wa_satz.
insert zlearn003_ART from wa_satz2.

SELECT * FROM zlearn003_ART INTO @wa_print.

  WRITE :wa_print-artikelnr, wa_print-kurztext, wa_print-langtext, wa_print-mwstklasse, wa_print-verkpreis,/.

ENDSELECT.

" Update


update zLearn003_ART set artikelnr = '5', kurztext = 'Bananen' where artikelnr = '2'.

wa_satz-kurztext = 'EIER'.
wa_satz-VERKPREIS = '100'.

update zlearn003_ART from wa_satz.



SELECT * FROM zlearn003_ART INTO @wa_print.

  WRITE :wa_print-artikelnr, wa_print-kurztext, wa_print-langtext, wa_print-mwstklasse, wa_print-verkpreis,/.

ENDSELECT.

" Delete

write :/ wa_satz-artikelnr, wa_satz-kurztext, wa_satz-langtext, wa_satz-mwstklasse, wa_satz-verkpreis.


write : / 'Before deleting' ,/.

SELECT * FROM zlearn003_ART INTO @wa_print.

  WRITE :wa_print-artikelnr, wa_print-kurztext, wa_print-langtext, wa_print-mwstklasse, wa_print-verkpreis,/.

ENDSELECT.




delete ZLEARN003_ART from wa_satz.

write : / 'after deleting' ,/.

SELECT * FROM zlearn003_ART INTO @wa_print.

  WRITE :wa_print-artikelnr, wa_print-kurztext, wa_print-langtext, wa_print-mwstklasse, wa_print-verkpreis,/.

ENDSELECT.


delete from zlearn003_art where artikelnr = '5'.

write : / 'after deleting with where' ,/.

SELECT * FROM zlearn003_ART INTO @wa_print.

  WRITE :wa_print-artikelnr, wa_print-kurztext, wa_print-langtext, wa_print-mwstklasse, wa_print-verkpreis,/.

ENDSELECT.
