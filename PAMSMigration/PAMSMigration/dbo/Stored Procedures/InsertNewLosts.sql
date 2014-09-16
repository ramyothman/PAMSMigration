﻿CREATE PROCEDURE [dbo].[InsertNewLosts]
    @InquiryNumber nvarchar(50),
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
    @LostPriceInEuro decimal(18,2)
AS
INSERT INTO [dbo].[Losts] (
    [InquiryNumber],
    [LostReasonID],
    [LostComment],
    [Comment],
    [UserName],
    [ModifiedDate],
    [WinnerName],
    [WinnerPrice],
    [WinnerPriceInEuro],
    [RateToEuro],
    [RateDate],
    [WinnerPriceCurrencyID],
    [ParentInquiryNumber],
    [IsSubLost],
    [LostPrice],
    [LostPriceCurrencyID],
    [LostPriceRateToEuro],
    [LostPriceRateDate],
    [LostPriceInEuro])
Values (
    @InquiryNumber,
    @LostReasonID,
    @LostComment,
    @Comment,
    @UserName,
    @ModifiedDate,
    @WinnerName,
    @WinnerPrice,
    @WinnerPriceInEuro,
    @RateToEuro,
    @RateDate,
    @WinnerPriceCurrencyID,
    @ParentInquiryNumber,
    @IsSubLost,
    @LostPrice,
    @LostPriceCurrencyID,
    @LostPriceRateToEuro,
    @LostPriceRateDate,
    @LostPriceInEuro)
    
IF @@ROWCOUNT > 0
Select * from Losts
Where [InquiryNumber] = @InquiryNumber