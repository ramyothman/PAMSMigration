CREATE PROCEDURE [dbo].[InsertNewCustomerSupplierRegistration]
            @ID int out
           ,@CustomerID int
           ,@SupplierID int
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
           ,@RegistrationDate datetime
           ,@RegistrationStatusID int
           ,@BranchID int
           
AS
INSERT INTO [dbo].[CustomerSupplierRegistration]
           ([CustomerID]
           ,[SupplierID]
           ,[RegistrationDate]
           ,[RegistrationStatusID]
           ,[UserName]
           ,[ModifiedDate]
           ,[BranchID])
     VALUES
           (@CustomerID
           ,@SupplierID
           ,@RegistrationDate
           ,@RegistrationStatusID
           ,@UserName
           ,@ModifiedDate
           ,@BranchID)
 
 IF @@ROWCOUNT > 0
 
 set @ID = @@identity
    
Select * from [dbo].[CustomerSupplierRegistration]
Where [ID] = @ID
