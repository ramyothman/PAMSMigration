CREATE VIEW [dbo].[GetAllIncome]
AS
SELECT     year, month, CurrencyID, SUM(CommissionAmountInEuro) AS AmountInEuro, SUM(CommissionAmount) AS Amount
FROM         (SELECT     YEAR(ONDate) AS year, MONTH(ONDate) AS month, CurrencyID, CommissionAmountInEuro, CommissionAmount
                       FROM          dbo.Commissions
                       UNION
                       SELECT     YEAR(dbo.CustomerPayments.ONDate) AS year, MONTH(dbo.CustomerPayments.ONDate) AS month, dbo.CustomerPayments.PaidAmountCurrencyID, 
                                             dbo.CustomerPayments.PaidAmountInEuro, dbo.CustomerPayments.PaidAmount AS Amount
                       FROM         dbo.CustomerPayments INNER JOIN
                                             dbo.Inquiries ON dbo.CustomerPayments.InquiryNumber = dbo.Inquiries.InquiryNumber
                       WHERE     (dbo.Inquiries.SupplierID = 12)
                       UNION
                       SELECT     YEAR(dbo.Journals.Date) AS year, MONTH(dbo.Journals.Date) AS month, dbo.Journals.CurrencyID, 
                                             dbo.Journals.AmountInEuro AS CommissionAmountInEuro, dbo.Journals.DebitValue AS CommissionAmount
                       FROM         dbo.Journals INNER JOIN
                                             dbo.Expenses ON dbo.Journals.ExpenseID = dbo.Expenses.ExpenseID INNER JOIN
                                             dbo.ExpenseType ON dbo.Expenses.ExpenseTypeID = dbo.ExpenseType.ExpenseTypeID
                       WHERE     (dbo.Journals.DebitValue > 0) OR
                                             (dbo.ExpenseType.Name LIKE N'Open Balance')) AS Payment
GROUP BY year, month, CurrencyID
