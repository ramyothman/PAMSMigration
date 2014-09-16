CREATE PROCEDURE [dbo].[DeleteTimeSheet]
    @ID int
AS
Begin
DELETE FROM [dbo].[TimeSheet]
      WHERE ID =@ID
End
