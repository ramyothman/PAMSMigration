CREATE PROCEDURE [dbo].[UpdateCustomerSupplierRegistration]
            @OldID int 
           ,@CustomerID int
           ,@SupplierID int
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
           ,@RegistrationDate datetime
           ,@RegistrationStatusID int
           ,@BranchID int = null
           
AS
UPDATE [dbo].[CustomerSupplierRegistration]
   SET [CustomerID] = @CustomerID
      ,[SupplierID] = @SupplierID
      ,[RegistrationDate] = @RegistrationDate
      ,[RegistrationStatusID] = @RegistrationStatusID
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
    
 WHERE ID = @OldID
