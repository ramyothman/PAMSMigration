-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateProjectTypes]
  @ProjectTypeColor nvarchar(50),
  @OldID int
AS
BEGIN
	UPDATE [dbo].[ProjectTypes]
   SET[ProjectTypeColor] = @ProjectTypeColor    
 WHERE ID = @OldID
 
END
