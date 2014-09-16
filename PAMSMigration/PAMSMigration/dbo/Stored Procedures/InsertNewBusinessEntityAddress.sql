CREATE PROCEDURE [dbo].[InsertNewBusinessEntityAddress]
    @BusinessEntityAddressId int output ,
    @BusinessEntityId int,
    @AddressId int,
    @AddressTypeId int,
    @RowGuid uniqueidentifier,
    @ModifiedDate datetime,
    @MainAddress bit
AS
if(@MainAddress = 'True')
begin
	update [Person].[BusinessEntityAddress] 
	set [MainAddress] = 'False'
	where [BusinessEntityId] = @BusinessEntityId
end
INSERT INTO [Person].[BusinessEntityAddress] (
    [BusinessEntityId],
    [AddressId],
    [AddressTypeId],
    [RowGuid],
    [ModifiedDate],
    [MainAddress])
Values (
    @BusinessEntityId,
    @AddressId,
    @AddressTypeId,
    @RowGuid,
    @ModifiedDate,
    @MainAddress)
Set @BusinessEntityAddressId = SCOPE_IDENTITY()
IF @@ROWCOUNT > 0
Select * from Person.BusinessEntityAddress
Where [BusinessEntityAddressId] = @@identity
