-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateProjectsHistory]
	@InquiryNumber nvarchar(50),
	@ProjectTypeID int,
	@Percentage decimal (18,4),
	@ModifiedDate datetime,
	@UserName nvarchar(50),
	@oldID int
AS
BEGIN
	UPDATE [dbo].[ProjectsHistory]
   SET [InquiryNumber] = @InquiryNumber
      ,[ProjectTypeID] = @ProjectTypeID
      ,[Percentage] = @Percentage 
      ,[ModifiedDate] = @ModifiedDate
      ,[UserName] = @UserName
 WHERE ID = @oldID
END
