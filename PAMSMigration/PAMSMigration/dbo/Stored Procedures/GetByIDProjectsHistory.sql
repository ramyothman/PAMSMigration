-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDProjectsHistory]
	@ID int
AS
BEGIN
	SELECT *
  FROM [dbo].[ProjectsHistory]
  Where ID = @ID
END
