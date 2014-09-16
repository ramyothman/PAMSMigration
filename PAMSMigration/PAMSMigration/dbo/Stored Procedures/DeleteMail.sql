CREATE PROCEDURE [dbo].[DeleteMail]
    @ID int
AS
Begin
 Delete Mails  where     [ID] = @ID
End
