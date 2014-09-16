-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDNotificationsTypes]
	@NotificationTypeID int
AS
BEGIN
  SELECT *
  FROM [dbo].[NotificationsTypes]
  WHERE NotificationTypeID= @NotificationTypeID
END
