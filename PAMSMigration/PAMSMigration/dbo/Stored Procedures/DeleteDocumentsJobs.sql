-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteDocumentsJobs]
	@ID int
AS
BEGIN
	DELETE FROM [dbo].[DocumentsJobs]
      WHERE ID = @ID
END
