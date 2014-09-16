CREATE VIEW [dbo].[GetAllInComeExpenseClassification]
AS
SELECT     InComeExpenseClassificationID, InComeExpenseClassificationID2, Name, HasOpenBalance, IsDebit, CurrencyID, IsClient, IsSupplier, IsJob
FROM         dbo.InComeExpenseClassification
WHERE     (InComeExpenseClassificationID <> 0)
