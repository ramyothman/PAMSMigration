CREATE PROCEDURE [dbo].[InsertNewTransactions]
    @TransactionID nvarchar(50),
    @SupplierID int,
    @InquiryCode nvarchar(50),
    @Amount money,  
    @CurrencyID int,
    @RateToEuro decimal (18,4),
    @AmountInEuro money,
    @BankID int,
    @TransactionDate datetime,
    @Reason nvarchar(600),
    @Reference nvarchar(600),
    @BranchID int
AS
INSERT INTO [dbo].[Transactions] (
    [TransactionID],
    [SupplierID],
    [InquiryCode],
    [Amount],
    [CurrencyID],
    [RateToEuro],
    [AmountInEuro],
    [BankID],
    [TransactionDate],
    [Reason],
    [Reference],
    [BranchID])
Values (
    @TransactionID,
    @SupplierID,
    @InquiryCode,
    @Amount,
    @CurrencyID,
    @RateToEuro,
    @AmountInEuro,
    @BankID,
    @TransactionDate,
    @Reason,
    @Reference,
    @BranchID)
IF @@ROWCOUNT > 0
Select * from Transactions
Where [TransactionID] = @TransactionID
