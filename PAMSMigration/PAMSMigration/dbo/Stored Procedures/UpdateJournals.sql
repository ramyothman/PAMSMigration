CREATE PROCEDURE [dbo].[UpdateJournals]
  
    @OldJournalID int,
    @DebitValue decimal(12,2),
    @CreditValue decimal(12,2),
    @ExpenseID int,
    @Date datetime,
    @Notes nvarchar(Max),
    @CurrencyID int,
    @RateToEuro decimal(12,2),
    @AmountInEuro decimal(12,2),
    @PaymentAccountTypeID int, 
    @EmployeeID int,
    @BankID int
AS
UPDATE [dbo].[Journals]
SET
    
    DebitValue = @DebitValue,
    CreditValue = @CreditValue,
    ExpenseID = @ExpenseID,
    Date = @Date,
    Notes = @Notes,
    CurrencyID = @CurrencyID,
    RateToEuro = @RateToEuro,
    AmountInEuro = @AmountInEuro,
    PaymentAccountTypeID = @PaymentAccountTypeID, 
    EmployeeID = @EmployeeID ,
    BankID  = @BankID
    
WHERE [JournalID] = @OLDJournalID
IF @@ROWCOUNT > 0
Select * From Journals 
Where [JournalID] = @OLDJournalID
