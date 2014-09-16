CREATE PROCEDURE [dbo].[InsertNewJournals]
    
    @DebitValue decimal(12,2),
    @CreditValue decimal(12,2),
    @ExpenseID int,
    @Date datetime,
    @Notes nvarchar(Max),
    @CurrencyID int,
    @RateToEuro decimal(12,2),
    @AmountInEuro decimal(12,2),
    @PaymentAccountTypeID int , 
    @EmployeeID int ,
    @BankID int ,
    @TransactionID int
AS
INSERT INTO [dbo].[Journals] (
   
    [DebitValue],
    [CreditValue],
    [ExpenseID],
    [Date],
    [Notes],
    [CurrencyID],
    [RateToEuro],
    [AmountInEuro],
    [PaymentAccountTypeID],
    [EmployeeID],
    [BankID],
    [TransactionID]
    )
Values (
   
    @DebitValue,
    @CreditValue,
    @ExpenseID,
    @Date,
    @Notes,
    @CurrencyID,
    @RateToEuro,
    @AmountInEuro,
    @PaymentAccountTypeID,
    @EmployeeID ,
    @BankID,
    @TransactionID)
IF @@ROWCOUNT > 0
Select * from Journals
Where [JournalID] = @@IDENTITY
