CREATE PROCEDURE [dbo].[InsertNewCustomerSupplierRegistrationComments]
            @ID int out
           ,@CustomerSupplierRegistrationID int
           ,@Comment nvarchar(MAX)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
           
AS
INSERT INTO [dbo].[CustomerSupplierRegistrationComments]
           ([CustomerSupplierRegistrationID]
           ,[Comment]
           ,[UserName]
           ,[ModifiedDate])
     VALUES
           (@CustomerSupplierRegistrationID
           ,@Comment
           ,@UserName
           ,@ModifiedDate)
 
 IF @@ROWCOUNT > 0
 
 set @ID = @@identity
    
Select * from [dbo].[CustomerSupplierRegistrationComments]
Where [ID] = @ID
