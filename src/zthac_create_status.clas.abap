CLASS zthac_create_status DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zthac_create_status IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.
    DATA itab TYPE TABLE OF zthac_ctr_status.

*   fill internal travel table (itab)
    itab = VALUE #(
      ( status = 'On-board' status_text = 'On-boarded'  )
      ( status = 'Off-board' status_text = 'Off-boarded' )
    ).

*   delete existing entries in the database table
    DELETE FROM zthac_ctr_status.

*   insert the new table entries
    INSERT zthac_ctr_status FROM TABLE @itab.

*   output the result as a console message
    out->write( |{ sy-dbcnt } status entries inserted successfully!| ).
ENDMETHOD.
ENDCLASS.
