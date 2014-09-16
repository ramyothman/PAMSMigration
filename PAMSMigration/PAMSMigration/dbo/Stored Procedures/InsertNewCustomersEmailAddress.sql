-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewCustomersEmailAddress]
            @CustomerEmailAddressID int out
	       ,@CustomerID int
           ,@EmailAddressTypeId int
           ,@Email nvarchar(60)
           ,@ModifiedDate datetime
           ,@UserName nvarchar(50)
           ,@MainEmailAddress bit
AS
BEGIN
if(@MainEmailAddress = 'True')
begin
	update [dbo].[CustomersEmailAddress]
	set MainEmailAddress = 'False'
	where CustomerID = @CustomerID
end
INSERT INTO [dbo].[CustomersEmailAddress]
           ([CustomerID]
           ,[EmailAddressTypeId]
           ,[Email]
           ,[ModifiedDate]
           ,[MainEmailAddress])
     VALUES
           (@CustomerID
           ,@EmailAddressTypeId
           ,@Email
           ,@ModifiedDate
           ,@MainEmailAddress)
           
 set @CustomerEmailAddressID =   @@identity 
 
 if @MainEmailAddress = 1 
   update CustomersEmailAddress set MainEmailAddress = 0 where CustomerID = @CustomerID
     and CustomerEmailAddressID  <> @CustomerEmailAddressID
 
 
 
 IF @@ROWCOUNT > 0
Select * from [CustomersEmailAddress]
Where CustomerEmailAddressID = @CustomerEmailAddressID
END
