CREATE PROCEDURE [dbo].[UpdateCustomerSupplierRegistrationComments]
            @OldID int 
           ,@CustomerSupplierRegistrationID int
           ,@Comment nvarchar(MAX)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
           
AS
UPDATE [dbo].[CustomerSupplierRegistrationComments]
   SET [CustomerSupplierRegistrationID] = @CustomerSupplierRegistrationID
      ,[Comment] = @Comment
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
 WHERE ID = @OldID
