-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteProjectsHistory]
	@ID int
AS
BEGIN
	DELETE FROM [dbo].[ProjectsHistory]
       WHERE ID = @ID
END
