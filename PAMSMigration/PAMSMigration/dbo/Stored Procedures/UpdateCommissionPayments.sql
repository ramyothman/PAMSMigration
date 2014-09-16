CREATE PROCEDURE [dbo].[UpdateCommissionPayments]
    @InquiryNumber nvarchar(50),
    @OldInquiryNumber nvarchar(50),
    @TransactionID nvarchar(50),
    @OldTransactionID nvarchar(50),
    @CommissionPaymentNumber int,
    @OldCommissionPaymentNumber int,
    @PaidCommissionAmount money,
    @ONDate datetime,
    @CurrencyID int,
    @RateToEuro decimal(18,2),
    @PaidCommissionAmountInEuro money,
    @SumPaidCommissionAmountInEuro money,
    @DueCommissionAmountInEuro money,
    @Comment ntext,
    @UserName nvarchar(50),
    @BankID int,
    @ModifiedDate datetime,
	@IsPaid bit
AS
UPDATE [dbo].[CommissionPayments]
SET
    InquiryNumber = @InquiryNumber,
    TransactionID = @TransactionID,
    CommissionPaymentNumber = @CommissionPaymentNumber,
    PaidCommissionAmount = @PaidCommissionAmount,
    ONDate = @ONDate,
    CurrencyID = @CurrencyID,
    RateToEuro = @RateToEuro,
    PaidCommissionAmountInEuro = @PaidCommissionAmountInEuro,
    SumPaidCommissionAmountInEuro = @SumPaidCommissionAmountInEuro,
    DueCommissionAmountInEuro = @DueCommissionAmountInEuro,
    Comment = @Comment,
    UserName = @UserName,
    BankID = @BankID,
    ModifiedDate = @ModifiedDate,
	IsPaid = @IsPaid
WHERE [InquiryNumber] = @OLDInquiryNumber
 AND [TransactionID] = @OLDTransactionID
 AND [CommissionPaymentNumber] = @OLDCommissionPaymentNumber
IF @@ROWCOUNT > 0
Select * From CommissionPayments 
Where [InquiryNumber] = @InquiryNumber
 AND [TransactionID] = @TransactionID
 AND [CommissionPaymentNumber] = @CommissionPaymentNumber
