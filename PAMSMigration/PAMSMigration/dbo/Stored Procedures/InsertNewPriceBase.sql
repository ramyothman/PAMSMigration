CREATE PROCEDURE [dbo].[InsertNewPriceBase]
    @PriceBaseCode nvarchar(50),
    @PriceBaseName nvarchar(50),
    @PriceBaseDescription ntext
AS
INSERT INTO [dbo].[PriceBase] (
    [PriceBaseCode],
    [PriceBaseName],
    [PriceBaseDescription])
Values (
    @PriceBaseCode,
    @PriceBaseName,
    @PriceBaseDescription)
IF @@ROWCOUNT > 0
Select * from PriceBase
Where [ID] = @@IDENTITY
