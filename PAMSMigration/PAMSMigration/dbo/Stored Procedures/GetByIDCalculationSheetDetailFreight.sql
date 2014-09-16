CREATE PROCEDURE [dbo].[GetByIDCalculationSheetDetailFreight]
    @CalculationSheetDetailFreightID int
AS
BEGIN
Select CalculationSheetDetailFreightID, CalculationSheetDetailID, FreightBaseID, FreightCurrencyID, FreightPrice, FreightPriceInCurrencyBase, FreightRateToCurrencyBase
From [dbo].[CalculationSheetDetailFreight]
WHERE [CalculationSheetDetailFreightID] = @CalculationSheetDetailFreightID
END
