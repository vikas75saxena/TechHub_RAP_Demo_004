CLASS zthac_cl_nr_obj_create DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zthac_cl_nr_obj_create IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA:
      lv_object   TYPE cl_numberrange_objects=>nr_attributes-object,
      lv_devclass TYPE cl_numberrange_objects=>nr_attributes-devclass,
      lv_corrnr   TYPE cl_numberrange_objects=>nr_attributes-corrnr,
      lt_interval TYPE cl_numberrange_intervals=>nr_interval,
      ls_interval TYPE cl_numberrange_intervals=>nr_nriv_line,
      o_nrobj_ref TYPE REF TO cx_number_ranges,
      o_nrnr_ref  TYPE REF TO cx_nr_object_not_found.

    lv_object   = 'ZTHAC_CTR'.
    lv_devclass = 'ZTECHHUB_DEMO_005'.
    lv_corrnr   = 'H01K900006'.
*Create Object
    TRY.
        cl_numberrange_objects=>create(
          EXPORTING
            attributes = VALUE #( object     = lv_object
                                  domlen     = 'ZTHAC_OBJECT_ID'
                                  percentage = 5
                                  buffer     = abap_true
                                  noivbuffer = 10
                                  devclass   = lv_devclass
                                  corrnr     = lv_corrnr )
            obj_text   = VALUE #( object     = lv_object
                                  langu      = 'E'
                                  txt        = 'Contractor Id number Range'
                                  txtshort   = 'Contractor Id' )
          IMPORTING
            errors     = DATA(lt_errors)
            returncode = DATA(lv_returncode)
            ).
        IF lt_errors IS INITIAL AND lv_returncode EQ 0.
          out->write( | Number Range Object Created | ).
        ELSE.
          out->write( | Number Range Object Creation failed | ).
        ENDIF.
      CATCH cx_number_ranges INTO o_nrobj_ref.
        out->write( o_nrobj_ref->if_message~get_longtext(  ) ).
    ENDTRY.
*Create Intervals
    ls_interval-nrrangenr  = '01'.
    ls_interval-fromnumber = '0000000001'.
    ls_interval-tonumber   = '1000099999'.
    ls_interval-procind    = 'I'.
    APPEND ls_interval TO lt_interval.
    TRY.
        CALL METHOD cl_numberrange_intervals=>create
          EXPORTING
            interval  = lt_interval
            object    = lv_object
            subobject = ' '
          IMPORTING
            error     = DATA(lv_error)
            error_inf = DATA(ls_error)
            error_iv  = DATA(lt_error_iv)
            warning   = DATA(lv_warning).
        IF lv_error IS INITIAL AND lt_error_iv IS INITIAL.
          out->write( | Number Range Interval Created | ).
        ELSE.
          out->write( | Number Range Interval Creation failed | ).
        ENDIF.
      CATCH cx_number_ranges INTO o_nrobj_ref.
        out->write( o_nrobj_ref->if_message~get_longtext(  ) ).
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
