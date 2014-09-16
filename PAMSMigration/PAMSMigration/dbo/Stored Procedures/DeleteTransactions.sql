CREATE PROCEDURE [dbo].[DeleteTransactions]
    @TransactionID nvarchar(50)
AS
Begin
 Delete [dbo].[Transactions] where     [TransactionID] = @TransactionID
End
