REPORT z_material_data.

*--- Types declaration ---
TYPES: BEGIN OF ty_mara,
        matnr TYPE mara-matnr,
        mtart TYPE mara-mtart,
        matkl TYPE mara-matkl,
        meins TYPE mara-meins,
        groes TYPE mara-groes,
        brgew TYPE mara-brgew,
        ntgew TYPE mara-ntgew,
        gewei TYPE mara-gewei,
        volum TYPE mara-volum,
        voleh TYPE mara-voleh,
      END OF ty_mara.

*--- Internal tables declaration ---
DATA: it_mara TYPE STANDARD TABLE OF ty_mara.

*--- Selection screen ---
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-001.
PARAMETERS: p_mtart TYPE mara-mtart OBLIGATORY.
SELECTION-SCREEN END OF BLOCK b1.

*--- Main processing ---
SELECT matnr mtart matkl meins groes brgew ntgew gewei volum voleh FROM mara
  INTO TABLE it_mara
  WHERE mtart = p_mtart.

*--- ALV display ---
DATA: lr_alv_table TYPE REF TO cl_salv_table.

TRY.
    cl_salv_table=>factory(
      IMPORTING
        r_salv_table = lr_alv_table
      CHANGING
        t_table = it_mara ).

    lr_alv_table->get_columns( )->set_optimize( abap_true ).
    lr_alv_table->get_column( 'MATNR' )->set_long_text( 'Material Number' ).
    lr_alv_table->get_column( 'MTART' )->set_long_text( 'Material Type' ).
    lr_alv_table->get_column( 'MATKL' )->set_long_text( 'Material Group' ).
    lr_alv_table->get_column( 'MEINS' )->set_long_text( 'Base Unit of Measure' ).
    lr_alv_table->get_column( 'GROES' )->set_long_text( 'Size' ).
    lr_alv_table->get_column( 'BRGEW' )->set_long_text( 'Gross weight' ).
    lr_alv_table->get_column( 'NTGEW' )->set_long_text( 'Net weight' ).
    lr_alv_table->get_column( 'GEWEI' )->set_long_text( 'Weight Unit' ).
    lr_alv_table->get_column( 'VOLUM' )->set_long_text( 'Volume' ).
    lr_alv_table->get_column( 'VOLEH' )->set_long_text( 'Volume Unit' ).

    lr_alv_table->display( ).
  CATCH cx_salv_msg.
ENDTRY.