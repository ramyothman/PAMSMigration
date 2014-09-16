CREATE PROCEDURE [dbo].[DeleteProjectContacts]
    @ProjectContactID int
AS
Begin
 Delete [dbo].[ProjectContacts] where     [ProjectContactID] = @ProjectContactID
End
