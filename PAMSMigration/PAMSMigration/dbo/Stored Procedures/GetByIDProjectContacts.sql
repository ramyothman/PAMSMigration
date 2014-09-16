CREATE PROCEDURE [dbo].[GetByIDProjectContacts]
    @ProjectContactID int
AS
BEGIN
Select ProjectContactID, ProjectID, ContactTitle, ContactName, ContactPosition, Mobile, Email
From [dbo].[ProjectContacts]
WHERE [ProjectContactID] = @ProjectContactID
END
