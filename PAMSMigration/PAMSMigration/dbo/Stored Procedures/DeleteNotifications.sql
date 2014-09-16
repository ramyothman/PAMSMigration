-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteNotifications]
	@ID int
AS
BEGIN
DELETE FROM [dbo].[Notifications]
      WHERE ID = @ID
END
