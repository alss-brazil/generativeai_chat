@AbapCatalog.sqlViewName: 'ZSALESORDERITEM'
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sales Order Item'
define view ZSalesOrderItem as select from vbap
join vbak on vbap.vbeln = vbak.vbeln
{
    key vbap.vbeln as SalesOrder,
    key vbap.posnr as SalesOrderItem,
    vbap.matnr as Product,
    @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
    vbap.lfimg as OrderQuantity, 
    vbap.lmein as OrderQuantityUnit, 
    @Semantics.amount.currencyCode: 'TransactionCurrency'
    vbap.netwr as NetAmount,
    vbap.waerk as TransactionCurrency, 
    vbak.erdat as CreationDate
}