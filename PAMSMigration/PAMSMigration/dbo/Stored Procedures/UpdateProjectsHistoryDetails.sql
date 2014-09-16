-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,,>
-- Description:	@Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateProjectsHistoryDetails]
            @ProjectHistoryID int
           ,@OrderStatusID int
           ,@InquiryStatusID int
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
           ,@oldID int
AS
BEGIN
	UPDATE [dbo].[ProjectsHistoryDetails]
   SET [ProjectHistoryID] =@ProjectHistoryID
      ,[OrderStatusID] =@OrderStatusID
      ,[InquiryStatusID] =@InquiryStatusID
      ,[UserName] =@UserName
      ,[ModifiedDate] =@ModifiedDate
 WHERE ID = @oldID
END
