﻿CREATE PROCEDURE [dbo].[InsertNewCommissions]
    @InquiryNumber nvarchar(50),
    @PriceCommissionBase money,
    @PercentPriceCommissionBase decimal(18,3),
    @CommissionPercent decimal(18,3),
    @CommissionAmount money,
    @CurrencyID int,
    @RateToEuro decimal(18,3),
    @ONDate datetime,
    @CommissionAmountInEuro money,
    @BankID int,
    @Comment ntext,
    @Paid bit,
    @UserName nvarchar(50),
    @ModifiedDate datetime,
    @MinPriceCommissionBase money,
    @MinPercentPriceCommissionBase decimal(18,3),
    @MinCommissionAmount money,
    @MinPercentCommissionAmount decimal(18,3),
    @BranchID int,
    @CustomerPaymentID int = 0 
AS
INSERT INTO [dbo].[Commissions] (
    [InquiryNumber],
    [PriceCommissionBase],
    [PercentPriceCommissionBase],
    [CommissionPercent],
    [CommissionAmount],
    [CurrencyID],
    [RateToEuro],
    [ONDate],
    [CommissionAmountInEuro],
    [BankID],
    [Comment],
    [Paid],
    [UserName],
    [ModifiedDate],
    [MinPriceCommissionBase],
    [MinPercentPriceCommissionBase],
    [MinCommissionAmount],
    [MinPercentCommissionAmount],
    [BranchID],
    [CustomerPaymentID])
Values (
    @InquiryNumber,
    @PriceCommissionBase,
    @PercentPriceCommissionBase,
    @CommissionPercent,
    @CommissionAmount,
    @CurrencyID,
    @RateToEuro,
    @ONDate,
    @CommissionAmountInEuro,
    @BankID,
    @Comment,
    @Paid,
    @UserName,
    @ModifiedDate,
    @MinPriceCommissionBase,
    @MinPercentPriceCommissionBase,
    @MinCommissionAmount,
    @MinPercentCommissionAmount,
    @BranchID,
    @CustomerPaymentID)
IF @@ROWCOUNT > 0
Select * from Commissions
Where [InquiryNumber] = @InquiryNumber
