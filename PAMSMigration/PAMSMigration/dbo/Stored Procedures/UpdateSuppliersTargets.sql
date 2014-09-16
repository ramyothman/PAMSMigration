-- =============================================
-- Author:		@Author,,Name>
-- Alter date: @Alter Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[UpdateSuppliersTargets]
	        @SupplierID int
           ,@Year int
           ,@Value decimal(18,2)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
           ,@BranchID int
           ,@oldID int
	AS
BEGIN
UPDATE [dbo].[SuppliersTargets]
   SET [SupplierID] = @SupplierID
      ,[Year] = @Year
      ,[Value] = @Value
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
      ,[BranchID] = @BranchID
 WHERE ID = @oldID
END
