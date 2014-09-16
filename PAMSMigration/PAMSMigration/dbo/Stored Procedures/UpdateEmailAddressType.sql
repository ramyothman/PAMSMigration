CREATE PROCEDURE [dbo].[UpdateEmailAddressType]
    @OldEmailAddressTypeId int,
    @Name nvarchar(50),
    @ModifiedDate datetime
AS
UPDATE [Person].[EmailAddressType]
SET
    Name = @Name,
    ModifiedDate = @ModifiedDate
WHERE [EmailAddressTypeId] = @OLDEmailAddressTypeId
IF @@ROWCOUNT > 0
Select * From Person.EmailAddressType 
Where [EmailAddressTypeId] = @OLDEmailAddressTypeId
