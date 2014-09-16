CREATE PROCEDURE [dbo].[GetByIDEmailAddressType]
    @EmailAddressTypeId int
AS
BEGIN
Select *
From [Person].[EmailAddressType]
WHERE [EmailAddressTypeId] = @EmailAddressTypeId
END
