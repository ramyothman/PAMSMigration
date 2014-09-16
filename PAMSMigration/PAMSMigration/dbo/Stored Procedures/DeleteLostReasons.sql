CREATE PROCEDURE [dbo].[DeleteLostReasons]
    @ID nvarchar(50)
AS
Begin
 Delete [dbo].[LostReasons] where     [ID] = @ID
End
