CREATE PROCEDURE [dbo].[UpdateSuppliersProducts]
            @OldSupplierProductID int out
           ,@SupplierID int
           ,@ProductDescription nvarchar(max)
           ,@ProductID int
           ,@ProductTypeID int
           ,@CategoryID int
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
           ,@IsActive bit
AS
UPDATE [dbo].[SuppliersProducts]
   SET [SupplierID] = @SupplierID
      ,[ProductDescription] = @ProductDescription
      ,[ProductID] = @ProductID
      ,[ProductTypeID] = @ProductTypeID
      ,[CategoryID] = @CategoryID
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
      ,[IsActive] = @IsActive
 WHERE [SupplierProductID] = @OldSupplierProductID
IF @@ROWCOUNT > 0
Select * from [dbo].[SuppliersProducts]
Where [SupplierProductID] = @OldSupplierProductID
