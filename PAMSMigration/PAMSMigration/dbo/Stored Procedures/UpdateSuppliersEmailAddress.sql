CREATE PROCEDURE [dbo].[UpdateSuppliersEmailAddress]
            @OldSupplierEmailAddressID int out
           ,@SupplierID int
           ,@EmailAddressTypeId int
           ,@Email nvarchar(60)
           ,@ModifiedDate datetime
           ,@UserName nvarchar(50)
           ,@MainEmailAddress bit
AS
--if(@MainEmailAddress = 'True')
--begin
--	update [dbo].[SuppliersEmailAddress]
--	set MainEmailAddress = 'False'
--	where SupplierID = @SupplierID
--end
UPDATE [dbo].[SuppliersEmailAddress]
   SET [SupplierID] = @SupplierID
      ,[EmailAddressTypeId] = @EmailAddressTypeId
      ,[Email] = @Email
      ,[ModifiedDate] = @ModifiedDate
      ,[UserName] = @UserName
      ,[MainEmailAddress] = @MainEmailAddress
 WHERE [SupplierEmailAddressID] =@OldSupplierEmailAddressID
if @MainEmailAddress = 1 
   update SuppliersEmailAddress set MainEmailAddress = 0 where SupplierID = @SupplierID
     and SupplierEmailAddressID  <> @OldSupplierEmailAddressID
IF @@ROWCOUNT > 0
Select * from [dbo].[SuppliersEmailAddress]
Where [SupplierEmailAddressID] = @OldSupplierEmailAddressID
