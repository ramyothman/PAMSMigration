CREATE PROCEDURE [dbo].[DeleteIDS]
    @ID int
AS
Begin
 Delete [dbo].[IDS] where     [ID] = @ID
End
