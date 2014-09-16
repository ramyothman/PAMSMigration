CREATE VIEW [dbo].[GetAllJournals]
AS
SELECT     JournalID, DebitValue, CreditValue, ExpenseID, Date, Notes, CurrencyID, RateToEuro, AmountInEuro, EmployeeID, BankID
FROM         dbo.Journals
