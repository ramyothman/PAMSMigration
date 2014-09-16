-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[UpdateUsersProjectsLog]
            @UserID int
           ,@ProjectLogID int
           ,@IsViewed bit
           ,@ViewedDate datetime
AS
BEGIN
UPDATE [dbo].[UsersProjectsLog]
   SET [IsViewed] = @IsViewed
      ,[ViewedDate] = @ViewedDate
 WHERE [UserID] = @UserID AND [ProjectLogID] = @ProjectLogID
END
