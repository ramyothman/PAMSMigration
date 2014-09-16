-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[UpdateCustomersPhones]
           @OldCustomerPhoneID int out
           ,@CustomerID int
           ,@PhoneNumber nvarchar(25)
           ,@PhoneNumberTypeId int
           ,@ModifiedDate datetime
           ,@MainPhone bit
           ,@UserName nvarchar(50)
           ,@ContactName nvarchar(250)
AS
BEGIN
if(@MainPhone = 'True')
begin
	update [dbo].[CustomersPhones]
	set [MainPhone] = 'False'
	where [CustomerID] = @CustomerID
end
UPDATE [dbo].[CustomersPhones]
   SET [CustomerID] = @CustomerID
      ,[PhoneNumber] = @PhoneNumber
      ,[PhoneNumberTypeId] = @PhoneNumberTypeId
      ,[ModifiedDate] = @ModifiedDate
      ,[MainPhone] = @MainPhone
      ,[UserName] = @UserName
      ,[ContactName] = @ContactName
Where CustomerPhoneID = @OldCustomerPhoneID
 IF @@ROWCOUNT > 0
Select * from [CustomersPhones]
Where CustomerPhoneID = @OldCustomerPhoneID
END
