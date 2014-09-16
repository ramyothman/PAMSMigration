-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateOrderBacklog]
 @InquiryNumber nvarchar(50),
 @Backlog decimal(18,2)
AS
BEGIN
	UPDATE [dbo].[Orders]
   SET[BackLog] =@Backlog
 WHERE [InquiryNumber] = @InquiryNumber
END
