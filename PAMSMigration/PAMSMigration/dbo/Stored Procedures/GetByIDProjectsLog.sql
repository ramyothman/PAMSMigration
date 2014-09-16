-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDProjectsLog]
	@ID INT
AS
BEGIN
SELECT * FROM  [dbo].[ProjectsLog]
WHERE ID = @ID
END
