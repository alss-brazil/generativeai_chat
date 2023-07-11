@AbapCatalog.sqlViewName: 'ZCV_CUST_ORDERS'
@AbapCatalog.compiler.CompareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer Orders'
define view ZCDS_CustOrders as select from kna1
association [0..*] to vbak as _Orders on $projection.kunnr = _Orders.kunnr
{
    key kna1.kunnr as CustomerID,
    kna1.name1 as CustomerName,
    _Orders.vbeln as OrderID,
    sum(_Orders.netwr) as TotalOrderAmount
}
where _Orders.erdat between @FromDate and @ToDate
group by kna1.kunnr, kna1.name1, _Orders.vbeln;