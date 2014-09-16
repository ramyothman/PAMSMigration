CREATE PROCEDURE [dbo].[DeleteMailJob]
    @ID int
AS
Begin
 Delete JobsMails   where     [ID] = @ID
End
