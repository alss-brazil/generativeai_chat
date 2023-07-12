@AbapCatalog.sqlViewName: 'ZVIEW_MATERIALS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Material Master Data'
define view ZMaterials
  as select from MARA
  inner join MVKE on MARA.matnr = MVKE.matnr
  left outer join MBEW on MARA.matnr = MBEW.matnr
{
  key MARA.matnr as MaterialNumber,
  MARA.mtart as MaterialType,
  MARA.mbrsh as IndustrySector,
  MVKE.vkorg as SalesOrganization,
  MVKE.vtweg as DistributionChannel,
  MVKE.spart as Division,
  MBEW.stprs as StandardPrice,
  MBEW.bwkey as ValuationArea
}
where MARA.mtart = $parameters.MaterialType;