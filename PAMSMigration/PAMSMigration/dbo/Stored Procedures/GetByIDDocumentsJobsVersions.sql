-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDDocumentsJobsVersions]
	@ID int
AS
BEGIN
	SELECT *
   FROM [dbo].[DocumentsJobsVersions]
   WHERE ID = @ID
END
