CREATE PROCEDURE [dbo].[InsertNewSuppliersProducts]
            @SupplierProductID int out
           ,@SupplierID int
           ,@ProductDescription nvarchar(max)
           ,@ProductID int
           ,@ProductTypeID int
           ,@CategoryID int
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
           ,@IsActive bit
AS
INSERT INTO [dbo].[SuppliersProducts]
           ([SupplierID]
           ,[ProductDescription]
           ,[ProductID]
           ,[ProductTypeID]
           ,[CategoryID]
           ,[UserName]
           ,[ModifiedDate]
           ,[IsActive])
     VALUES
           (@SupplierID
           ,@ProductDescription
           ,@ProductID
           ,@ProductTypeID
           ,@CategoryID
           ,@UserName
           ,@ModifiedDate
           ,@IsActive)
set @SupplierProductID = @@identity
IF @@ROWCOUNT > 0
Select * from [dbo].[SuppliersProducts]
Where [SupplierProductID] = @SupplierProductID
