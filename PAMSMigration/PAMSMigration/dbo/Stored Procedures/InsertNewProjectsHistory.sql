-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewProjectsHistory]
	@InquiryNumber nvarchar(50),
	@ProjectTypeID int,
	@Percentage decimal (18,4),
	@ModifiedDate datetime,
	@UserName nvarchar(50)
AS
BEGIN
	INSERT INTO [dbo].[ProjectsHistory]
           ([InquiryNumber]
           ,[ProjectTypeID]
           ,[Percentage]
           ,[ModifiedDate]
           ,[UserName])
     VALUES
           (@InquiryNumber
           ,@ProjectTypeID
           ,@Percentage
           ,@ModifiedDate
           ,@UserName)
END
