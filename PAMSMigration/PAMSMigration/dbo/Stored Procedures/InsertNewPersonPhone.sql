CREATE  PROCEDURE [dbo].[InsertNewPersonPhone]
    @PersonPhoneId int output ,
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
INSERT INTO [Person].[PersonPhone] (
    [BusinessEntityId],
    [PhoneNumber],
    [PhoneNumberTypeId],
    [ModifiedDate],
    [PhoneVerified],
    [PhoneVerificationCode],
    [MainPhone])
Values (
    @BusinessEntityId,
    @PhoneNumber,
    @PhoneNumberTypeId,
    @ModifiedDate,
    @PhoneVerified,
    @PhoneVerificationCode,
    @MainPhone)
Set @PersonPhoneId = SCOPE_IDENTITY()
IF @@ROWCOUNT > 0
Select * from Person.PersonPhone
Where [PersonPhoneId] = @@identity
