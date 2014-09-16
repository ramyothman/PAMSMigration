-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[UpdateCustomerMarket]
            @OldID int out
	       ,@CustomerMarket nvarchar(250)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
AS
BEGIN
UPDATE [dbo].[CustomerMarkets]
   SET [CustomerMarket] = @CustomerMarket
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
 WHERE ID = @OldID
 IF @@ROWCOUNT > 0
Select * from [dbo].[CustomerMarkets]
Where [ID] = @OldID
END
