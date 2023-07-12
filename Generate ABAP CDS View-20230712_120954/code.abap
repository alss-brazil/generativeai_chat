@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Purchase Order with Vendor Details'
@Metadata.ignorePropagatedAnnotations: true
define view ZI_PurchaseOrder as select from ekko
association [0..*] to ekpo on ekko.ebeln = ekpo.ebeln
association [0..1] to lfa1 on ekko.lifnr = lfa1.lifnr
{
  key ekko.ebeln as PurchaseOrderNumber,
  ekko.bedat as PurchaseOrderDate,
  ekko.bukrs as CompanyCode,
  ekpo.ebelp as PurchaseOrderItem,
  ekpo.matnr as MaterialNumber,
  ekpo.menge as OrderQuantity,
  ekpo.meins as OrderQuantityUnit,
  lfa1.lifnr as VendorNumber,
  lfa1.name1 as VendorName,
  lfa1.ort01 as VendorCity,
  lfa1.land1 as VendorCountry
}