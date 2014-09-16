CREATE PROCEDURE [dbo].[UpdatePriceBase]
    @PriceBaseCode nvarchar(50),
    @OldID int,
    @PriceBaseName nvarchar(50),
    @PriceBaseDescription ntext
AS
UPDATE [dbo].[PriceBase]
SET
    PriceBaseCode = @PriceBaseCode,
    PriceBaseName = @PriceBaseName,
    PriceBaseDescription = @PriceBaseDescription
WHERE [ID] = @OLDID
IF @@ROWCOUNT > 0
Select * From PriceBase 
Where [ID] = @OLDID
