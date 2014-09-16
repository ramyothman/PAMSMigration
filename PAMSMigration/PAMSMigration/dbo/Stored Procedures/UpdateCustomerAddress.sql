-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[UpdateCustomerAddress]
            @OldCustomerAddressID int 
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
UPDATE [dbo].[CustomerAddress]
   SET [CustomerID] = @CustomerID
      ,[AddressTypeID] = @AddressTypeID
      ,[Address] = @Address
      ,[CountryRegionCode] = @CountryRegionCode
      ,[CityID] = @CityID
      ,[PostalCode] = @PostalCode
      ,[ZipCode] = @ZipCode
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
      ,[MainAddress] = @MainAddress
 WHERE CustomerAddressID = @OldCustomerAddressID
IF @@ROWCOUNT > 0
Select * From [CustomerAddress] 
Where [CustomerAddressID] = @OldCustomerAddressID
END
