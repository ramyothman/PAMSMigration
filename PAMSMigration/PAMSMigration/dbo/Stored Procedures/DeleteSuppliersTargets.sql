Create PROCEDURE [dbo].[DeleteSuppliersTargets]
    @ID int
AS
Begin
 Delete [dbo].[SuppliersTargets] where     [ID] = @ID
End
