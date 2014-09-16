-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewCustomerAddress]
            @CustomerAddressID int out
	       ,@CustomerID int
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
BEGIN
if(@MainAddress = 'True')
begin
	update [dbo].[CustomerAddress]
	set MainAddress = 'False'
	where CustomerID = @CustomerID
end
INSERT INTO [dbo].[CustomerAddress]
           ([CustomerID]
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
           (@CustomerID
           ,@AddressTypeID
           ,@Address
           ,@CountryRegionCode
           ,@CityID
           ,@PostalCode
           ,@ZipCode
           ,@UserName
           ,@ModifiedDate
           ,@MainAddress)
  set @CustomerAddressID =  @@identity     
 IF @@ROWCOUNT > 0
Select * from [CustomerAddress]
Where [CustomerAddressID] = @CustomerAddressID
END
