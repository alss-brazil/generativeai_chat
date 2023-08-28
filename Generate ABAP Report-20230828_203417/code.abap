REPORT z_generated_code.

TABLES: EQUI.

*--- Declarations ---
TYPES: BEGIN OF ty_equi,
         equnr TYPE equi-equnr,
         eqtyp TYPE equi-eqtyp,
         eqart TYPE equi-eqart,
         groes TYPE equi-groes,
         brgew TYPE equi-brgew,
         gewei TYPE equi-gewei,
         ansdt TYPE equi-ansdt,
         answt TYPE equi-answt,
       END OF ty_equi.
DATA: it_equi TYPE STANDARD TABLE OF ty_equi.

*--- Selection Screen ---
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-b01.
  SELECT-OPTIONS so_eqart FOR equi-eqart.
SELECTION-SCREEN END OF BLOCK b1.

*--- Main Processing ---
SELECT equnr eqtyp eqart groes brgew gewei ansdt answt INTO TABLE it_equi FROM equi
WHERE eqart IN so_eqart.

*--- Display Output ---
CL_SALV_TABLE=>FACTORY(
  EXPORTING
    LIST_DISPLAY = ABAP_TRUE
  IMPORTING
    R_SALV_TABLE = DATA(lr_salv_table)
  CHANGING
    T_TABLE = it_equi ).

lr_salv_table->display( ).