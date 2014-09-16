-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[UpdateCustomersEmailAddress]
            @OldCustomerEmailAddressID int out
	       ,@CustomerID int
           ,@EmailAddressTypeId int
           ,@Email nvarchar(60)
           ,@ModifiedDate datetime
           ,@MainEmailAddress bit
AS
BEGIN
if(@MainEmailAddress = 'True')
begin
	update [dbo].[CustomersEmailAddress]
	set MainEmailAddress = 'False'
	where CustomerID = @CustomerID
end
UPDATE [dbo].[CustomersEmailAddress]
   SET [CustomerID] = @CustomerID
      ,[EmailAddressTypeId] = @EmailAddressTypeId
      ,[Email] = @Email
      ,[ModifiedDate] = @ModifiedDate
      ,[MainEmailAddress] = @MainEmailAddress
 WHERE CustomerEmailAddressID = @OldCustomerEmailAddressID
 
  if @MainEmailAddress = 1 
   update CustomersEmailAddress set MainEmailAddress = 0 where CustomerID = @CustomerID
     and CustomerEmailAddressID  <> @OldCustomerEmailAddressID
 
 IF @@ROWCOUNT > 0
Select * from [CustomersEmailAddress]
Where CustomerEmailAddressID = @OldCustomerEmailAddressID
END
