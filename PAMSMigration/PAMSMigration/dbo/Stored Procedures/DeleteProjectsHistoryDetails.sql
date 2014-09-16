-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteProjectsHistoryDetails]
 @ID int 
AS
BEGIN
	DELETE FROM [dbo].[ProjectsHistoryDetails]
      WHERE ID = @ID
END
