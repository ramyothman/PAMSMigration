-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,,>
-- Description:	@Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewProjectsLog]
            @ID INT out
	       ,@ProjectID int
           ,@SerializeObject varbinary(MAX)
           ,@VersionNumber int
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime 
AS
BEGIN
INSERT INTO [dbo].[ProjectsLog]
           ([ProjectID]
           ,[SerializeObject]
           ,[VersionNumber]
           ,[UserName]
           ,[ModifiedDate])
     VALUES
           (@ProjectID
           ,@SerializeObject
           ,@VersionNumber
           ,@UserName
           ,@ModifiedDate)
           
IF @@ROWCOUNT > 0
begin
   SET @ID = SCOPE_IDENTITY() 
   
	Select * from  [dbo].[ProjectsLog]
	Where [ID] = @ID
end
END
