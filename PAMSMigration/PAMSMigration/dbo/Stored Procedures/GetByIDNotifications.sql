-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDNotifications]
	@ID int
AS
BEGIN
  SELECT *
  FROM [dbo].[Notifications]
  WHERE ID = @ID
END
