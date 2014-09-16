CREATE PROCEDURE [dbo].[DeleteProductColumns]
    @ID int
AS
Begin
 Delete [dbo].[ProductColumns] where     [ID] = @ID
End
