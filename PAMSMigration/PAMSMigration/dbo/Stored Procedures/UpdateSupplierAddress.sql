CREATE PROCEDURE [dbo].[UpdateSupplierAddress]
            @OldSupplierAddressID int out
           ,@SupplierID int
           ,@AddressTypeID int
           ,@Address nvarchar(max)
           ,@CountryRegionCode char(3)
           ,@CityID int
           ,@PostalCode nvarchar(15)
           ,@ZipCode nvarchar(15)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
           ,@MainAddress bit
AS
if(@MainAddress = 'True')
begin
	update [dbo].[SupplierAddress]
	set MainAddress = 'False'
	where SupplierID = @SupplierID
end
UPDATE [dbo].[SupplierAddress]
   SET [SupplierID] = @SupplierID
      ,[AddressTypeID] = @AddressTypeID
      ,[Address] = @Address
      ,[CountryRegionCode] = @CountryRegionCode
      ,[CityID] = @CityID
      ,[PostalCode] = @PostalCode
      ,[ZipCode] = @ZipCode
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
      ,[MainAddress] = @MainAddress
 WHERE SupplierAddressID = @OldSupplierAddressID 
IF @@ROWCOUNT > 0
Select * from [dbo].[SupplierAddress]
Where [SupplierAddressID] = @OldSupplierAddressID
