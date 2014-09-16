-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,,>
-- Description:	@Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateNewProjectsLog]
            @OldID INT 
	       ,@ProjectID int
           ,@SerializeObject varbinary(MAX)
           ,@VersionNumber int
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime 
AS
BEGIN
UPDATE [dbo].[ProjectsLog]
   SET [ProjectID] = @ProjectID
      ,[SerializeObject] = @SerializeObject
      ,[VersionNumber] = @VersionNumber
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
 WHERE ID = @OldID
END
