*&---------------------------------------------------------------------*
*& Report Z_LEARN003_WRITEANWEISUNG
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z_LEARN003_WRITEANWEISUNG.

"Einfache und einzelne  Ausgabe
write '1. Das ist eine einfache Ausgabe (Einzelne)'.

" Mit dem Schlüsselwort Skip, lässt man ein beisschen platz
skip 2.

"Mehrere Ausgaben ohne Zeilenumbruch
write: '2. Das ist eine einfache Ausgabe',
'Mit dem Doppelpunkte kann mann trotz der Zeilenumbruch im Code auch Ausgabe machen.',
'Aber es hat eine Nachteile, welche ist, dass die Ausgabe keien Zeielnumbruch enthält',
'Sondern wir als Fließtext ausgegeben'.


skip 2.

"Mehrere Ausgaben mit Zeilenumbruch.

write :/ '3. Durch Doppenpunkte : und einem slah /, kann man',
/ 'Mehrere Zeilenumbrüche machen. Aber die Voraussetzung ist,',
'dass man bei den Stellen, wo man Zeilenumbruch einfügen will, einfach', / 'das Zeichen / nutzt.'.

skip 2.
"Manchmal brauchen wir eine Zeichenkette an einem bestimmten spalte zu positionieren. Mit dem
"Schlüsselwort AT, können wir das schaffen

write: AT 5 'Hier' , /,
at 10 'Oder hier', / ,
at 100 'Oder Hier'.

"Alternative man kann auch auf AT + Nummer verzischten und schreibt man direkt die Nummer
"vor dem ersten Anführungszeichen '. Aber pass auf, falls du / nutz, mann danach die nummer ohne
"Leerzeichen direkt nebenstehen

WRITE: /1 'Lehrer',
        /5 'Student',
        /20 'Schulleiter'.

" To creat an underline after the sentence you wrote. In case it was important of something

uline.
uline.

write: 'The difference between / and new-line. is'.
new-line.
write: 'New-Line. you have to write it outside the write statment'.
new-line.
write: 'But /',/,' you can only use it inside the write statment'.


skip 5.

*
* PS1: At unutz man für eine einzige, einzelne und einfache Write Anweisung. Das heißt ohne :
* PS2: / + Nummer kombiniert man, falls wir eine Write Anweisung mit mehrere Zeilen. Bzw. mit :
* PS3 : / (Zeilenumbruch) + mehrere Werte → Positionierung geht verloren.
*PS4: AT und / kombiniert man auf gar keinen Fall
* PS5: Auch / + die Nummer schreibt man ohne Leerzeichen.
*
