-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDNotificationPersons]
	@NotificationPersonID int
AS
BEGIN
  SELECT *
  FROM [dbo].[NotificationPersons]
  WHERE NotificationPersonID = @NotificationPersonID
END
