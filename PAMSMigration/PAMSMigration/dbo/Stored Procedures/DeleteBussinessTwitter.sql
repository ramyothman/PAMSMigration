CREATE PROCEDURE [dbo].[DeleteBussinessTwitter]
    @ID int
AS
Begin
 DELETE FROM [dbo].[BussinessTwitter]
 where     [ID] = @ID
End
