CREATE PROCEDURE [dbo].[DeleteSystemPages]
    @ID int
AS
Begin
 Delete [dbo].[SystemPages] where     [ID] = @ID
End
