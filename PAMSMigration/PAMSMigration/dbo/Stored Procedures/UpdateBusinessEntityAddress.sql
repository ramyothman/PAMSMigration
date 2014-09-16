CREATE PROCEDURE [dbo].[UpdateBusinessEntityAddress]
    @OldBusinessEntityAddressId int,
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
UPDATE [Person].[BusinessEntityAddress]
SET
    BusinessEntityId = @BusinessEntityId,
    AddressId = @AddressId,
    AddressTypeId = @AddressTypeId,
    RowGuid = @RowGuid,
    ModifiedDate = @ModifiedDate,
    MainAddress = @MainAddress
WHERE [BusinessEntityAddressId] = @OLDBusinessEntityAddressId
IF @@ROWCOUNT > 0
Select * From Person.BusinessEntityAddress 
Where [BusinessEntityAddressId] = @OLDBusinessEntityAddressId
