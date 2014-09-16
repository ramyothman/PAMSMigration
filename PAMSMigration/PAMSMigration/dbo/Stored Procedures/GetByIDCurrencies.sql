CREATE PROCEDURE [dbo].[GetByIDCurrencies]
    @ID int
AS
BEGIN
Select *
From [dbo].[Currencies]
WHERE [ID] = @ID
END
