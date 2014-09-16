CREATE PROCEDURE [dbo].[DeleteCity]
    @ID int
AS
Begin
 Delete [dbo].[Cities] where     ID = @ID
End
