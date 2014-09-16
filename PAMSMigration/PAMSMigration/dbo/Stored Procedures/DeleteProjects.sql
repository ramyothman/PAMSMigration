CREATE PROCEDURE [dbo].[DeleteProjects]
    @ProjectID int 
AS
Begin
 Delete [dbo].[Projects] where     ID = @ProjectID
End
