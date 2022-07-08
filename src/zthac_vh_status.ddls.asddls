@AbapCatalog.sqlViewName: 'ZTHSTATUSVH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Status Value help'
@ObjectModel.resultSet.sizeCategory:#XS
define view ZTHAC_VH_STATUS as select from zthac_ctr_status {
    key status,
        status_text
}
