CREATE PROCEDURE [dbo].[UpdateCommissions]
    @InquiryNumber nvarchar(50),
    @OldInquiryNumber nvarchar(50),
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
    @CustomerPaymentID int=0
AS
UPDATE [dbo].[Commissions]
SET
    InquiryNumber = @InquiryNumber,
    PriceCommissionBase = @PriceCommissionBase,
    PercentPriceCommissionBase = @PercentPriceCommissionBase,
    CommissionPercent = @CommissionPercent,
    CommissionAmount = @CommissionAmount,
    CurrencyID = @CurrencyID,
    RateToEuro = @RateToEuro,
    ONDate = @ONDate,
    CommissionAmountInEuro = @CommissionAmountInEuro,
    BankID = @BankID,
    Comment = @Comment,
    Paid = @Paid,
    UserName = @UserName,
    ModifiedDate = @ModifiedDate,
    MinPriceCommissionBase = @MinPriceCommissionBase,
    MinPercentPriceCommissionBase = @MinPercentPriceCommissionBase,
    MinCommissionAmount = @MinCommissionAmount,
    MinPercentCommissionAmount = @MinPercentCommissionAmount,
    BranchID = @BranchID
WHERE [InquiryNumber] = @OLDInquiryNumber and CustomerPaymentID = @CustomerPaymentID
IF @@ROWCOUNT > 0
Select * From Commissions 
Where [InquiryNumber] = @InquiryNumber and CustomerPaymentID = @CustomerPaymentID
