CREATE PROCEDURE [dbo].[GetByIDEmailAddress]
    @EmailAddressId int
AS
BEGIN
Select * From [Person].[EmailAddress]
WHERE [EmailAddressId] = @EmailAddressId
END
