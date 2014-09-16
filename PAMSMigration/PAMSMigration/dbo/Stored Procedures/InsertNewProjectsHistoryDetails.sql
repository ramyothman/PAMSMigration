-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,,>
-- Description:	@Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewProjectsHistoryDetails]
            @ProjectHistoryID int
           ,@OrderStatusID int
           ,@InquiryStatusID int
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
AS
BEGIN
	INSERT INTO [dbo].[ProjectsHistoryDetails]
           ([ProjectHistoryID]
           ,[OrderStatusID]
           ,[InquiryStatusID]
           ,[UserName]
           ,[ModifiedDate])
     VALUES
           (@ProjectHistoryID
           ,@OrderStatusID
           ,@InquiryStatusID
           ,@UserName
           ,@ModifiedDate)
END
