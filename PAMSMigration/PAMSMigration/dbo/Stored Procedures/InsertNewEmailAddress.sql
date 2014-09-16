CREATE PROCEDURE [dbo].[InsertNewEmailAddress]
    @EmailAddressId int output ,
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
INSERT INTO [Person].[EmailAddress] (
    [BusinessEntityId],
    [EmailAddressTypeId],
    [Email],
    [EmailVerified],
    [EmailVerificationHash],
    [RowGuid],
    [ModifiedDate],
    [MainEmailAddress])
Values (
    @BusinessEntityId,
    @EmailAddressTypeId,
    @Email,
    @EmailVerified,
    @EmailVerificationHash,
    @RowGuid,
    @ModifiedDate 
    ,@MainEmailAddress)
Set @EmailAddressId = SCOPE_IDENTITY()
if @MainEmailAddress = 1 
   update person.EmailAddress set MainEmailAddress = 0 where BusinessEntityId = @BusinessEntityId
     and  EmailAddressId <> @EmailAddressId
IF @@ROWCOUNT > 0
Select * from Person.EmailAddress
Where [EmailAddressId] = @@identity
