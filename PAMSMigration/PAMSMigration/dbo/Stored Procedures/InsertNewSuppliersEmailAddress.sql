CREATE PROCEDURE [dbo].[InsertNewSuppliersEmailAddress]
            @SupplierEmailAddressID int out
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
INSERT INTO [dbo].[SuppliersEmailAddress]
           ([SupplierID]
           ,[EmailAddressTypeId]
           ,[Email]
           ,[ModifiedDate]
           ,[UserName]
           ,[MainEmailAddress])
     VALUES
           (@SupplierID
           ,@EmailAddressTypeId
           ,@Email
           ,@ModifiedDate
           ,@UserName
           ,@MainEmailAddress)
set @SupplierEmailAddressID = @@identity
if @MainEmailAddress = 1 
   update SuppliersEmailAddress set MainEmailAddress = 0 where SupplierID = @SupplierID
     and SupplierEmailAddressID  <> @SupplierEmailAddressID
IF @@ROWCOUNT > 0
Select * from [dbo].[SuppliersEmailAddress]
Where [SupplierEmailAddressID] = @SupplierEmailAddressID
