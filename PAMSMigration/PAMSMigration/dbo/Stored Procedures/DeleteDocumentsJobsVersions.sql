-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteDocumentsJobsVersions]
	@ID int
AS
BEGIN
	DELETE FROM [dbo].[DocumentsJobsVersions]
      WHERE ID = @ID
END
