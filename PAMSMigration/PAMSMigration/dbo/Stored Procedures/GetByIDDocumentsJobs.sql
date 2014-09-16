-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDDocumentsJobs]
	@ID int
AS
BEGIN
	SELECT *
   FROM [dbo].[DocumentsJobs]
   WHERE ID = @ID
END
