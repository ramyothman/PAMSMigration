-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date, 
-- Description:	@Description, 
-- =============================================
CREATE PROCEDURE [dbo].[UpdateNotificationsTypes]
            @OldNotificationTypeID int 
	       ,@NotificationType nvarchar(50) 
           ,@UserName nvarchar(50) 
           ,@ModifiedDate datetime
AS
BEGIN
  UPDATE [dbo].[NotificationsTypes]
   SET [NotificationType] = @NotificationType
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
 WHERE NotificationTypeID = @OldNotificationTypeID
   
END
