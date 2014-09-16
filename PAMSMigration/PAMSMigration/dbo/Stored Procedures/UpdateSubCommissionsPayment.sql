CREATE PROCEDURE [dbo].[UpdateSubCommissionsPayment]
    @SubCommissionID int,
    @OldSubCommissionID int,
    @SubCommissionPaymentNumber int,
    @OldSubCommissionPaymentNumber int,
    @PaidSubCommissionAmount decimal(18,0),
    @ONDate datetime,
    @CurrencyID int,
    @RateToEuro numeric,
    @PaidSubCommissionAmountInEuro decimal(18,0),
    @SumPaidSubCommissionAmountInEuro decimal(18,0),
    @DueSubCommissionAmountInEuro decimal(18,0),
    @Comment ntext,
    @UserName nvarchar(50),
    @BankID int,
    @ModifiedDate datetime
AS
UPDATE [dbo].[SubCommissionsPayment]
SET
    SubCommissionID = @SubCommissionID,
    SubCommissionPaymentNumber = @SubCommissionPaymentNumber,
    PaidSubCommissionAmount = @PaidSubCommissionAmount,
    ONDate = @ONDate,
    CurrencyID = @CurrencyID,
    RateToEuro = @RateToEuro,
    PaidSubCommissionAmountInEuro = @PaidSubCommissionAmountInEuro,
    SumPaidSubCommissionAmountInEuro = @SumPaidSubCommissionAmountInEuro,
    DueSubCommissionAmountInEuro = @DueSubCommissionAmountInEuro,
    Comment = @Comment,
    UserName = @UserName,
    BankID = @BankID,
    ModifiedDate = @ModifiedDate
WHERE [SubCommissionID] = @OLDSubCommissionID
 AND [SubCommissionPaymentNumber] = @OLDSubCommissionPaymentNumber
IF @@ROWCOUNT > 0
Select * From SubCommissionsPayment 
Where [SubCommissionID] = @SubCommissionID
 AND [SubCommissionPaymentNumber] = @SubCommissionPaymentNumber
