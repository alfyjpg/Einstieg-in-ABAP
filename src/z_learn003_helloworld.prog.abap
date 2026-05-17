*&---------------------------------------------------------------------*
*& Report Z_LEARN003_HELLOWORLD
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_learn003_helloworld.

TYPES: BEGIN OF calender,
         day   TYPE n LENGTH 2,
         month TYPE n LENGTH 2,
         year  TYPE n LENGTH 4,
       END OF calender.


DATA date TYPE calender.

date-year = sy-datum+0(4).
date-month = sy-datum+4(2).
date-day = sy-datum+6(2).


WRITE : AT 55 '=================================================================='.

WRITE AT 75 'Hello World'.
WRITE : /75 'Benutzer: ', sy-uname.
write : / ' Date: '.
write : date-day, date-month, date-year ,/.

WRITE : AT 55 '=================================================================='.
