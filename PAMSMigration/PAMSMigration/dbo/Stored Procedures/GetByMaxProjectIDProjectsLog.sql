-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByMaxProjectIDProjectsLog]
	@ProjectID INT
AS
BEGIN
SELECT * FROM  [dbo].[ProjectsLog]
WHERE ProjectID = @ProjectID AND ID = (SELECT MAX(ID) FROM [dbo].[ProjectsLog]
WHERE ProjectID = @ProjectID)
END
