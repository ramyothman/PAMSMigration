-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[UpdateCustomersTypes]
            @OldID int out
	       ,@CustomerType nvarchar(50)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
AS
BEGIN
UPDATE [dbo].[CustomersTypes]
   SET [CustomerType] = @CustomerType
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
 WHERE [ID] = @OldID
   
 IF @@ROWCOUNT > 0
Select * from [CustomersTypes]
Where [ID] = @OldID
END
