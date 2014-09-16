CREATE PROCEDURE [dbo].[UpdateCalculationSheetDetailFreight]
    @OldCalculationSheetDetailFreightID int,
    @CalculationSheetDetailID int,
    @FreightBaseID int,
    @FreightCurrencyID int,
    @FreightPrice decimal(18,2),
    @FreightPriceInCurrencyBase decimal(18,2),
    @FreightRateToCurrencyBase decimal(18, 2)
AS
UPDATE [dbo].[CalculationSheetDetailFreight]
SET
    CalculationSheetDetailID = @CalculationSheetDetailID,
    FreightBaseID = @FreightBaseID,
    FreightCurrencyID = @FreightCurrencyID,
    FreightPrice = @FreightPrice,
    FreightPriceInCurrencyBase = @FreightPriceInCurrencyBase,
    FreightRateToCurrencyBase = @FreightRateToCurrencyBase
WHERE [CalculationSheetDetailFreightID] = @OLDCalculationSheetDetailFreightID
IF @@ROWCOUNT > 0
Select * From CalculationSheetDetailFreight 
Where [CalculationSheetDetailFreightID] = @OLDCalculationSheetDetailFreightID
