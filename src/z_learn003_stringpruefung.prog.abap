*&---------------------------------------------------------------------*
*& Report Z_LEARN003_STRINGPRUEFUNG
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z_LEARN003_STRINGPRUEFUNG.

DATA(word) = 'hello Mr. Ramadan'.


if word ca 'c*'.
  write : 'Gefunden!'.
  else.
    write 'nope'.

    endif.
