CREATE PROCEDURE [dbo].[GetByIDPriceBase]
    @ID int
AS
BEGIN
Select *
From [dbo].[PriceBase]
WHERE [ID] = @ID
END
