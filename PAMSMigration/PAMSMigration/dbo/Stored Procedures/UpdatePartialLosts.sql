CREATE PROCEDURE [dbo].[UpdatePartialLosts]
    @PartialOrderID int,
    @OldPartialOrderID int,
    @LostReasonID int,
    @LostComment nvarchar(100),
    @Comment ntext,
    @UserName nvarchar(50),
    @ModifiedDate datetime,
    @WinnerName nvarchar(150),
    @WinnerPrice money,
    @WinnerPriceInEuro money,
    @RateToEuro decimal(18,2),
    @RateDate datetime,
    @WinnerPriceCurrencyID int
AS
UPDATE [dbo].[PartialLost]
SET
    PartialOrderID = @PartialOrderID,
    LostReasonID = @LostReasonID,
    LostComment = @LostComment,
    Comment = @Comment,
    UserName = @UserName,
    ModifiedDate = @ModifiedDate,
    WinnerName = @WinnerName,
    WinnerPrice = @WinnerPrice,
    WinnerPriceInEuro = @WinnerPriceInEuro,
    RateToEuro = @RateToEuro,
    RateDate = @RateDate,
    WinnerPriceCurrencyID = @WinnerPriceCurrencyID
WHERE [PartialOrderID] = @OLDPartialOrderID
IF @@ROWCOUNT > 0
Select * From PartialLost 
Where [PartialOrderID] = @PartialOrderID
