CREATE PROCEDURE [dbo].[UpdateSuppliersPhones]
            @OldSupplierPhoneID int out
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
UPDATE [dbo].[SuppliersPhones]
   SET [SupplierID] = @SupplierID
      ,[PhoneNumber] = @PhoneNumber
      ,[PhoneNumberTypeId] = @PhoneNumberTypeId
      ,[ModifiedDate] = @ModifiedDate
      ,[MainPhone] = @MainPhone
      ,[UserName] = @UserName
      ,[ContactName] = @ContactName
 WHERE [SupplierPhoneID] = @OldSupplierPhoneID
IF @@ROWCOUNT > 0
Select * from [dbo].[SuppliersPhones]
Where [SupplierPhoneID] = @OldSupplierPhoneID
