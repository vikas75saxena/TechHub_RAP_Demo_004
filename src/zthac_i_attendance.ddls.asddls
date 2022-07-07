@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Contractor Attendance'
define view entity ZTHAC_I_ATTENDANCE as select from zthac_attend as _attendance
association to parent ZTHAC_I_CONTRACTOR as _contractor
    on $projection.ContractorKey = _contractor.ContractorKey 
{
    key attendance_key as AttendanceKey,
    contractor_key as ContractorKey,
    entry_date as EntryDate,
    time_in as TimeIn,
    time_out as TimeOut,
@Semantics.user.createdBy: true    
    created_by as CreatedBy,
@Semantics.systemDateTime.createdAt: true    
    created_at as CreatedAt,
@Semantics.user.lastChangedBy: true    
    last_changed_by as ChangedBy,
@Semantics.systemDateTime.localInstanceLastChangedAt: true    
    last_changed_at as ChangedAt,
    _contractor // Make association public
}
