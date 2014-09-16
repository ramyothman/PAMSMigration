CREATE PROCEDURE [dbo].[GetByIDTransactions]
    @TransactionID nvarchar(50)
AS
BEGIN
Select *
From [dbo].[Transactions]
WHERE [TransactionID] = @TransactionID
END
