METHOD if_ex_equip_cfldlg_ext~validate_field.

  DATA: 
    ls_field_input TYPE if_eamcfldlg=>field_input,
    lv_error_msg   TYPE string.

  " Get the value and ID of the field for which validation is required
  ls_field_input = input_data->get_field_input( ).
  IF ls_field_input-id EQ 'EQTYP'.

    " Validate the field data
    DATA(lv_value) = ls_field_input-value.
    IF lv_value EQ 'ABC'.
      lv_error_msg = 'Invalid equipment type.';
      output_data->set_error_message( iv_error_message = lv_error_msg ).
    ENDIF.

  ENDIF.
ENDMETHOD.