CREATE PROCEDURE [dbo].[UpdateProjectContacts]
    @OldProjectContactID int,
    @ProjectID int,
    @ContactTitle nvarchar(50),
    @ContactName nvarchar(50),
    @ContactPosition nvarchar(50),
    @Mobile nvarchar(50),
    @Email nvarchar(50)
AS
UPDATE [dbo].[ProjectContacts]
SET
    ProjectID = @ProjectID,
    ContactTitle = @ContactTitle,
    ContactName = @ContactName,
    ContactPosition = @ContactPosition,
    Mobile = @Mobile,
    Email = @Email
WHERE [ProjectContactID] = @OLDProjectContactID
IF @@ROWCOUNT > 0
Select * From ProjectContacts 
Where [ProjectContactID] = @OLDProjectContactID
