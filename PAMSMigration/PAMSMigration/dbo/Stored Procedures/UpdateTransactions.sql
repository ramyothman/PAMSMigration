CREATE PROCEDURE [dbo].[UpdateTransactions]
    @TransactionID nvarchar(50),
    @OldTransactionID nvarchar(50),
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
UPDATE [dbo].[Transactions]
SET
    TransactionID = @TransactionID,
    SupplierID = @SupplierID,
    InquiryCode = @InquiryCode,
    Amount = @Amount,
    CurrencyID = @CurrencyID,
    RateToEuro = @RateToEuro,
    AmountInEuro = @AmountInEuro,
    BankID = @BankID,
    TransactionDate = @TransactionDate,
    Reason = @Reason,
    Reference = @Reference,
    BranchID = @BranchID
WHERE [TransactionID] = @OLDTransactionID
IF @@ROWCOUNT > 0
Select * From Transactions 
Where [TransactionID] = @TransactionID
