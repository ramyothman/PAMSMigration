-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewCustomersTypes]
            @ID int out
	       ,@CustomerType nvarchar(50)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
AS
BEGIN
INSERT INTO [dbo].[CustomersTypes]
           ([CustomerType]
           ,[UserName]
           ,[ModifiedDate])
     VALUES
           (@CustomerType
           ,@UserName
           ,@ModifiedDate)
   set @ID =    @@identity         
 IF @@ROWCOUNT > 0
Select * from [dbo].[CustomersTypes]
Where [ID] = @ID
END
