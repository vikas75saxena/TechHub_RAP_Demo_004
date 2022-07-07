@EndUserText.label: 'Contractor Attendance - Projection'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@UI: {
  headerInfo: { typeName: 'Attendance',
                typeNamePlural: 'Attendance',
                title: { type: #STANDARD, value: 'AttendanceKey' }
  }
}

@Search.searchable: true
define view entity ZTHAC_C_ATTENDANCE
//  provider contract transactional_query
  as projection on ZTHAC_I_ATTENDANCE
{
      @UI.facet: [ { id:              'Attendance',
                     purpose:         #STANDARD,
                     type:            #IDENTIFICATION_REFERENCE,
                     label:           'Attendance',
                     position:        10 } ]

      @UI.hidden: true
  key AttendanceKey,
      @UI.hidden: true
      ContractorKey,
      @UI: {
          lineItem:       [ { position: 10, importance: #HIGH } ],
          identification: [ { position: 10, label: 'Entry Date' } ] }
      @Search.defaultSearchElement: true
      EntryDate,
      @UI: {
      lineItem:       [ { position: 20, importance: #HIGH } ],
      identification: [ { position: 20, label: 'In Time' } ] }
      TimeIn,
      @UI: {
      lineItem:       [ { position: 30, importance: #HIGH } ],
      identification: [ { position: 30, label: 'Out Time' } ] }
      TimeOut,
      @UI.hidden: true
      CreatedBy,
      @UI.hidden: true
      CreatedAt,
      @UI.hidden: true
      ChangedBy,
      @UI.hidden: true
      ChangedAt,
      /* Associations */
      _contractor : redirected to parent ZTHAC_C_CONTRACTOR
}
