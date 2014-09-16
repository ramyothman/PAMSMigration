CREATE PROCEDURE [dbo].[InsertNewCommissionPayments]
    @InquiryNumber nvarchar(50),
    @TransactionID nvarchar(50),
    @CommissionPaymentNumber int,
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
INSERT INTO [dbo].[CommissionPayments] (
    [InquiryNumber],
    [TransactionID],
    [CommissionPaymentNumber],
    [PaidCommissionAmount],
    [ONDate],
    [CurrencyID],
    [RateToEuro],
    [PaidCommissionAmountInEuro],
    [SumPaidCommissionAmountInEuro],
    [DueCommissionAmountInEuro],
    [Comment],
    [UserName],
    [BankID],
    [ModifiedDate],
	IsPaid
    )
Values (
    @InquiryNumber,
    @TransactionID,
    @CommissionPaymentNumber,
    @PaidCommissionAmount,
    @ONDate,
    @CurrencyID,
    @RateToEuro,
    @PaidCommissionAmountInEuro,
    @SumPaidCommissionAmountInEuro,
    @DueCommissionAmountInEuro,
    @Comment,
    @UserName,
    @BankID,
    @ModifiedDate,
	@IsPaid)
IF @@ROWCOUNT > 0
Select * from CommissionPayments
Where [InquiryNumber] = @InquiryNumber
AND [TransactionID] = @TransactionID
AND [CommissionPaymentNumber] = @CommissionPaymentNumber
