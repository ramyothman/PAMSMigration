CREATE  PROCEDURE [dbo].[UpdatePersonPhone]
    @OldId int,
    @BusinessEntityId int,
    @PhoneNumber nvarchar(25),
    @PhoneNumberTypeId int,
    @ModifiedDate datetime,
    @PhoneVerified bit,
    @PhoneVerificationCode nvarchar(50),
    @MainPhone bit
AS
if(@MainPhone = 'True')
begin
	update [Person].[PersonPhone] 
	set [MainPhone] = 'False'
	where [BusinessEntityId] = @BusinessEntityId
end
UPDATE [Person].[PersonPhone]
SET
    BusinessEntityId = @BusinessEntityId,
    PhoneNumber = @PhoneNumber,
    PhoneNumberTypeId = @PhoneNumberTypeId,
    ModifiedDate = @ModifiedDate,
    PhoneVerified = @PhoneVerified,
    PhoneVerificationCode = @PhoneVerificationCode,
    MainPhone = @MainPhone
WHERE [PersonPhoneId] = @OLDId
IF @@ROWCOUNT > 0
Select * From Person.PersonPhone 
Where [PersonPhoneId] = @OLDId
