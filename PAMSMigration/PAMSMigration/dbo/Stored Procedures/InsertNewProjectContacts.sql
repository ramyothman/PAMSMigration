CREATE PROCEDURE [dbo].[InsertNewProjectContacts]
    @ProjectID int,
    @ContactTitle nvarchar(50),
    @ContactName nvarchar(50),
    @ContactPosition nvarchar(50),
    @Mobile nvarchar(50),
    @Email nvarchar(50)
AS
INSERT INTO [dbo].[ProjectContacts] (
    [ProjectID],
    [ContactTitle],
    [ContactName],
    [ContactPosition],
    [Mobile],
    [Email])
Values (
    @ProjectID,
    @ContactTitle,
    @ContactName,
    @ContactPosition,
    @Mobile,
    @Email)
IF @@ROWCOUNT > 0
Select * from ProjectContacts
Where [ProjectContactID] = @@identity
