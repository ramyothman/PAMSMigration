-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,,>
-- Description:	@Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateSupplierTypes]
	-- Add the parameters for the stored procedure here
        	@SupplierType nvarchar(50)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
           ,@OldID int 
AS
BEGIN
UPDATE [dbo].[SuppliersTypes]
   SET [SupplierType] = @SupplierType
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
 WHERE ID = @OldID
           
 if(@@ROWCOUNT >0)
 select * from [dbo].[SuppliersTypes] where ID = @OldID
END
