CREATE PROCEDURE [dbo].[InsertNewCalculationSheetDetailFreight]
    @CalculationSheetDetailID int,
    @FreightBaseID int,
    @FreightCurrencyID int,
    @FreightPrice decimal(18,2),
    @FreightPriceInCurrencyBase decimal(18,2),
    @FreightRateToCurrencyBase decimal(18, 2)
AS
INSERT INTO [dbo].[CalculationSheetDetailFreight] (
    [CalculationSheetDetailID],
    [FreightBaseID],
    [FreightCurrencyID],
    [FreightPrice],
    [FreightPriceInCurrencyBase],
    [FreightRateToCurrencyBase])
Values (
    @CalculationSheetDetailID,
    @FreightBaseID,
    @FreightCurrencyID,
    @FreightPrice,
    @FreightPriceInCurrencyBase,
    @FreightRateToCurrencyBase)
IF @@ROWCOUNT > 0
Select * from CalculationSheetDetailFreight
Where [CalculationSheetDetailFreightID] = @@identity
