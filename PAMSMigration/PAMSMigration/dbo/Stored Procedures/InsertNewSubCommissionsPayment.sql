CREATE PROCEDURE [dbo].[InsertNewSubCommissionsPayment]
    @SubCommissionID int,
    @SubCommissionPaymentNumber int,
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
INSERT INTO [dbo].[SubCommissionsPayment] (
    [SubCommissionID],
    [SubCommissionPaymentNumber],
    [PaidSubCommissionAmount],
    [ONDate],
    [CurrencyID],
    [RateToEuro],
    [PaidSubCommissionAmountInEuro],
    [SumPaidSubCommissionAmountInEuro],
    [DueSubCommissionAmountInEuro],
    [Comment],
    [UserName],
    [BankID],
    [ModifiedDate])
Values (
    @SubCommissionID,
    @SubCommissionPaymentNumber,
    @PaidSubCommissionAmount,
    @ONDate,
    @CurrencyID,
    @RateToEuro,
    @PaidSubCommissionAmountInEuro,
    @SumPaidSubCommissionAmountInEuro,
    @DueSubCommissionAmountInEuro,
    @Comment,
    @UserName,
    @BankID,
    @ModifiedDate)
IF @@ROWCOUNT > 0
Select * from SubCommissionsPayment
Where [SubCommissionID] = @SubCommissionID
AND [SubCommissionPaymentNumber] = @SubCommissionPaymentNumber
