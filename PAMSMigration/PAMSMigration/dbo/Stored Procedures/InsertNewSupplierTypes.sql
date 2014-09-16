-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,,>
-- Description:	@Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewSupplierTypes]
	-- Add the parameters for the stored procedure here
        	@SupplierType nvarchar(50)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
           ,@ID int out
AS
BEGIN
INSERT INTO [dbo].[SuppliersTypes]
          ([SupplierType]
           ,[UserName]
           ,[ModifiedDate])
     VALUES
           (@SupplierType
           ,@UserName
           ,@ModifiedDate)
           
 set @ID = @@IDENTITY
 if(@@ROWCOUNT >0)
 select * from [dbo].[SuppliersTypes] where ID = @ID
END
