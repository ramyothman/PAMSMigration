CREATE PROCEDURE [dbo].[UpdateLosts]
    @InquiryNumber nvarchar(50),
    @OldInquiryNumber nvarchar(50),
    @LostReasonID int = null ,
    @LostComment nvarchar(100),
    @Comment ntext,
    @UserName nvarchar(50),
    @ModifiedDate datetime,
    @WinnerName nvarchar(150),
    @WinnerPrice money,
    @WinnerPriceInEuro money,
    @RateToEuro decimal(18,2),
    @RateDate datetime,
    @WinnerPriceCurrencyID int,
    @ParentInquiryNumber nvarchar(50),
    @IsSubLost bit,
    @LostPrice decimal(18,2),
    @LostPriceCurrencyID int,
    @LostPriceRateToEuro decimal(18,2),
    @LostPriceRateDate datetime,
    @LostPriceInEuro decimal(18,2),
    @oldLostID int
AS
UPDATE [dbo].[Losts]
SET
    InquiryNumber = @InquiryNumber,
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
    WinnerPriceCurrencyID = @WinnerPriceCurrencyID,
    ParentInquiryNumber = @ParentInquiryNumber,
    IsSubLost = @IsSubLost,
    [LostPrice] = @LostPrice,
    [LostPriceCurrencyID] = @LostPriceCurrencyID,
    [LostPriceRateToEuro] = @LostPriceRateToEuro,
    [LostPriceRateDate] = @LostPriceRateDate,
    [LostPriceInEuro] = @LostPriceInEuro
WHERE LostID = @oldLostID 
IF @@ROWCOUNT > 0
Select * From Losts 
Where [InquiryNumber] = @InquiryNumber
