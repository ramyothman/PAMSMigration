CREATE PROCEDURE [dbo].[InsertNewSupplierAddress]
            @SupplierAddressID int out
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
INSERT INTO [dbo].[SupplierAddress]
           ([SupplierID]
           ,[AddressTypeID]
           ,[Address]
           ,[CountryRegionCode]
           ,[CityID]
           ,[PostalCode]
           ,[ZipCode]
           ,[UserName]
           ,[ModifiedDate]
           ,[MainAddress])
     VALUES
           (@SupplierID
           ,@AddressTypeID
           ,@Address
           ,@CountryRegionCode
           ,@CityID
           ,@PostalCode
           ,@ZipCode
           ,@UserName
           ,@ModifiedDate
           ,@MainAddress)
set @SupplierAddressID = @@identity
IF @@ROWCOUNT > 0
Select * from [dbo].[SupplierAddress]
Where [SupplierAddressID] = @SupplierAddressID
