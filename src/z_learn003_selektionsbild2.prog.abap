REPORT z_learn003_selektionsbild2.

TABLES: zlearn003_art.

SELECT-OPTIONS range FOR zlearn003_art-artikelnr.

DATA itab TYPE STANDARD TABLE OF zlearn003_art.

DATA wa_satz TYPE zlearn003_art.



SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN COMMENT 1(8) TEXT-002.
    PARAMETERS vorname TYPE string.
    SELECTION-SCREEN COMMENT 70(9) TEXT-003.
    PARAMETERS nachname TYPE string.
  SELECTION-SCREEN END OF LINE.

selection-screen begin of line.
selection-screen comment 1(11) TEXT-004.
  parameters box as CHECKBOX.
  selection-screen end of line.

  selection-screen begin of line.

    selection-screen comment 1(12) text-005.
    parameters rd1 radiobutton GROUP g1.
    selection-screen comment 25(15) text-006.
    parameters rd2 radiobutton group g1.
    selection-screen comment 50(10) text-007.
    parameters rd3 radiobutton group g1.

    selection-screen end of line.


SELECTION-SCREEN END OF BLOCK b1.


selection-screen skip 4.


selection-screen begin of block b2 with frame title text-008.
parameters: strasse type string,
hausnr type n,
plz type n.
  selection-screen end of block b2.


start-OF-SELECTION.
SELECT * FROM zlearn003_art INTO TABLE @itab
  WHERE artikelnr IN @range.

WRITE: 'Hier ist die Tabelle...', /.

LOOP AT itab INTO wa_satz.
  WRITE: wa_satz-artikelnr, wa_satz-kurztext, wa_satz-langtext, wa_satz-mwstklasse, wa_satz-verkpreis,/.
ENDLOOP.
