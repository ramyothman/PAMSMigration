-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[UpdateTemplate]
      @Name nvarchar(50)
      ,@TemplateFL ntext
      ,@TemplateSL ntext
      ,@UserName nvarchar(50)
      ,@ModifiedDate datetime
	  ,@oldID int
 AS
BEGIN
UPDATE [dbo].[Templates]
   SET [Name] = @Name
      ,[TemplateFL] = @TemplateFL
      ,[TemplateSL] = @TemplateSL
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
  WHERE ID = @oldID
END
