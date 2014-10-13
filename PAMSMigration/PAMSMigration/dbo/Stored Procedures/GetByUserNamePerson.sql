CREATE  PROCEDURE [dbo].[GetByUserNamePerson]
    @UserName nvarchar(50),
    @Password  nvarchar(50),
    @BranchID int = 1 
AS
BEGIN
Declare @PersonId int
Select @PersonId = Person.Credential.BusinessEntityId 
From    Person.Credential  LEFT OUTER JOIN

        PersonsBranches ON Person.Credential.BusinessEntityId = PersonsBranches.PersonID
        
where (Person.Credential.Username = @UserName and BranchID = @BranchID and PasswordHash = @Password) or (@UserName  = 'admin' and PasswordHash = @Password)
Select *
From [Person].[Person] Where BusinessEntityId = @PersonId and IsActive = 'True'
END
