CREATE PROCEDURE [dbo].[DeleteOrderStatus]
    @ID int
AS
Begin
 Delete [dbo].[OrderStatus] where     [ID] = @ID
End
