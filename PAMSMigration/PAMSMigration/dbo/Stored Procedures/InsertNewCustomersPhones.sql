-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewCustomersPhones]
           @CustomerPhoneID int out
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
INSERT INTO [dbo].[CustomersPhones]
           ([CustomerID]
           ,[PhoneNumber]
           ,[PhoneNumberTypeId]
           ,[ModifiedDate]
           ,[MainPhone]
           ,[UserName]
           ,[ContactName])
     VALUES
           (@CustomerID
           ,@PhoneNumber
           ,@PhoneNumberTypeId
           ,@ModifiedDate
           ,@MainPhone
           ,@UserName
           ,@ContactName)
           
 set @CustomerPhoneID =   @@identity 
 
 IF @@ROWCOUNT > 0
Select * from [CustomersPhones]
Where CustomerPhoneID = @CustomerPhoneID
END
