CREATE PROCEDURE [dbo].[DeleteSuppliersTypes]
    @ID int
AS
Begin
 Delete [dbo].[SuppliersTypes] where     [ID] = @ID
End
