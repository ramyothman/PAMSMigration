-- =============================================
-- Author:		@Author,,Name>
-- Alter date: @Alter Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewSuppliersTargets]
                     
	        @SupplierID int
           ,@Year int
           ,@Value decimal(18,2)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
           ,@BranchID int
	AS
BEGIN
INSERT INTO [dbo].[SuppliersTargets]
           ([SupplierID]
           ,[Year]
           ,[Value]
           ,[UserName]
           ,[ModifiedDate]
           ,[BranchID])
     VALUES
           (@SupplierID
           ,@Year
           ,@Value
           ,@UserName
           ,@ModifiedDate
           ,@BranchID)
END
