-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteNotificationsTypes]
	@NotificationTypeID int
AS
BEGIN
DELETE FROM [dbo].[NotificationsTypes]
      WHERE NotificationTypeID = @NotificationTypeID
END
