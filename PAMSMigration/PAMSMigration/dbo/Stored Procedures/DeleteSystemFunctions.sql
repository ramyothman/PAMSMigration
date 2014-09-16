CREATE PROCEDURE [dbo].[DeleteSystemFunctions]
    @ID int
AS
Begin
 Delete [dbo].[SystemFunctions] where     [ID] = @ID
End
