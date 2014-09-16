-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewCustomerMarket]
            @ID int out
	       ,@CustomerMarket nvarchar(250)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
AS
BEGIN
INSERT INTO [dbo].[CustomerMarkets]
           ([CustomerMarket]
           ,[UserName]
           ,[ModifiedDate])
     VALUES
           (@CustomerMarket
           ,@UserName
           ,@ModifiedDate)
   set @ID =        @@identity
 IF @@ROWCOUNT > 0
Select * from [dbo].[CustomerMarkets]
Where [ID] = @ID
END
