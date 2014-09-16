-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteNotificationPersons]
	@NotificationPersonID int
AS
BEGIN
DELETE FROM [dbo].[NotificationPersons]
      WHERE NotificationPersonID = @NotificationPersonID
END
