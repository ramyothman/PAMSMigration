CREATE PROCEDURE [dbo].[InsertNewSuppliersPhones]
            @SupplierPhoneID int out
           ,@SupplierID int
           ,@PhoneNumber nvarchar(25)
           ,@PhoneNumberTypeId int
           ,@ModifiedDate datetime
           ,@MainPhone bit
           ,@UserName nvarchar(50)
           ,@ContactName nvarchar(250)
AS
if(@MainPhone = 'True')
begin
	update [dbo].[SuppliersPhones]
	set [MainPhone] = 'False'
	where [SupplierID] = @SupplierID
end
INSERT INTO [dbo].[SuppliersPhones]
           ([SupplierID]
           ,[PhoneNumber]
           ,[PhoneNumberTypeId]
           ,[ModifiedDate]
           ,[MainPhone]
           ,[UserName]
           ,[ContactName])
     VALUES
           (@SupplierID
           ,@PhoneNumber
           ,@PhoneNumberTypeId
           ,@ModifiedDate
           ,@MainPhone
           ,@UserName
           ,@ContactName)
set @SupplierPhoneID = @@identity
IF @@ROWCOUNT > 0
Select * from [dbo].[SuppliersPhones]
Where [SupplierPhoneID] = @SupplierPhoneID
