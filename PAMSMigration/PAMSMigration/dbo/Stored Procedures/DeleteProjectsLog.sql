-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteProjectsLog]
	@ID int
AS
BEGIN
DELETE [dbo].[ProjectsLog]
WHERE ID = @ID
END
