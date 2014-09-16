CREATE PROCEDURE [dbo].[UpdateEmailAddress]
    @OldEmailAddressId int,
    @BusinessEntityId int,
    @EmailAddressTypeId int,
    @Email nvarchar(60),
    @EmailVerified bit,
    @EmailVerificationHash nvarchar(128),
    @RowGuid uniqueidentifier,
    @ModifiedDate datetime,
    @MainEmailAddress bit
AS
--if(@MainEmailAddress = 'True')
--begin
--	update [Person].[EmailAddress]
--	set MainEmailAddress = 'False'
--	where BusinessEntityId = @BusinessEntityId
--end
UPDATE [Person].[EmailAddress]
SET
    BusinessEntityId = @BusinessEntityId,
    EmailAddressTypeId = @EmailAddressTypeId,
    Email = @Email,
    EmailVerified = @EmailVerified,
    EmailVerificationHash = @EmailVerificationHash,
    RowGuid = @RowGuid,
    ModifiedDate = @ModifiedDate,
    MainEmailAddress = @MainEmailAddress
WHERE [EmailAddressId] = @OLDEmailAddressId
if @MainEmailAddress = 1 
   update person.EmailAddress set MainEmailAddress = 0 where BusinessEntityId = @BusinessEntityId
     and  EmailAddressId <> @OLDEmailAddressId
IF @@ROWCOUNT > 0
Select * From Person.EmailAddress 
Where [EmailAddressId] = @OLDEmailAddressId
