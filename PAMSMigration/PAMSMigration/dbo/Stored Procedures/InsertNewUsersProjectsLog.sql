-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewUsersProjectsLog]
            @UserID int
           ,@ProjectLogID int
           ,@IsViewed bit
           ,@ViewedDate datetime
AS
BEGIN
INSERT INTO [dbo].[UsersProjectsLog]
           ([UserID]
           ,[ProjectLogID]
           ,[IsViewed]
           ,[ViewedDate])
     VALUES
           (@UserID
           ,@ProjectLogID
           ,@IsViewed
           ,@ViewedDate)
           
IF @@ROWCOUNT > 0     
	Select * from  [dbo].[UsersProjectsLog]
	Where [UserID] = @UserID AND [ProjectLogID] = @ProjectLogID
END
