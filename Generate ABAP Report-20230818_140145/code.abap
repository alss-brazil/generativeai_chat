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
SELECT-OPTIONS so_eqart FOR equi-eqart.

*--- Main Processing ---
SELECT equnr eqtyp eqart groes brgew gewei ansdt answt INTO TABLE it_equi FROM equi
  WHERE eqart IN so_eqart.

*--- Display Output ---
cl_salv_table=>factory(
  EXPORTING
    list_display = abap_true
  IMPORTING
    r_salv_table = DATA(lr_salv_table)
  CHANGING
    t_table      = it_equi ).

*--- Set Field Catalog for Output List ---
DATA: lt_fieldcat TYPE lvc_t_fcat.

CLEAR lt_fieldcat.

ls_fieldcat-fieldname = 'EQUNR'.
ls_fieldcat-ref_table = 'EQUI'.
APPEND ls_fieldcat TO lt_fieldcat.

ls_fieldcat-fieldname = 'EQTYP'.
ls_fieldcat-ref_table = 'EQUI'.
APPEND ls_fieldcat TO lt_fieldcat.

ls_fieldcat-fieldname = 'EQART'.
ls_fieldcat-ref_table = 'EQUI'.
APPEND ls_fieldcat TO lt_fieldcat.

ls_fieldcat-fieldname = 'GROES'.
ls_fieldcat-ref_table = 'EQUI'.
ls_fieldcat-tabname   = 'EQUI'.
APPEND ls_fieldcat TO lt_fieldcat.

ls_fieldcat-fieldname = 'BRGEW'.
ls_fieldcat-ref_table = 'EQUI'.
APPEND ls_fieldcat TO lt_fieldcat.

ls_fieldcat-fieldname = 'GEWEI'.
ls_fieldcat-ref_table = 'EQUI'.
APPEND ls_fieldcat TO lt_fieldcat.

ls_fieldcat-fieldname = 'ANSDT'.
ls_fieldcat-ref_table = 'EQUI'.
APPEND ls_fieldcat TO lt_fieldcat.

ls_fieldcat-fieldname = 'ANSWT'.
ls_fieldcat-ref_table = 'EQUI'.
APPEND ls_fieldcat TO lt_fieldcat.

lr_salv_table->get_functions( )->set_all( abap_true ).

lr_salv_table->get_columns( )->set_table_for_first_display(
  EXPORTING i_structure_name = 'TY_EQUI'
  CHANGING  it_fieldcatalog   = lt_fieldcat ).