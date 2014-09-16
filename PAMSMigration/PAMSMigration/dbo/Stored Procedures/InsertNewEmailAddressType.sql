CREATE PROCEDURE [dbo].[InsertNewEmailAddressType]
    @EmailAddressTypeId int output ,
    @Name nvarchar(50),
    @ModifiedDate datetime
AS
INSERT INTO [Person].[EmailAddressType] (
    [Name],
    [ModifiedDate])
Values (
    @Name,
    @ModifiedDate)
Set @EmailAddressTypeId = SCOPE_IDENTITY()
IF @@ROWCOUNT > 0
Select * from Person.EmailAddressType
Where [EmailAddressTypeId] = @@identity
