-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date, 
-- Description:	@Description, 
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewNotificationsTypes]
            @NotificationTypeID int out
	       ,@NotificationType nvarchar(50) 
           ,@UserName nvarchar(50) 
           ,@ModifiedDate datetime
AS
BEGIN
INSERT INTO [dbo].[NotificationsTypes]
           ([NotificationType]
           ,[UserName]
           ,[ModifiedDate])
     VALUES
           (@NotificationType
           ,@UserName 
           ,@ModifiedDate)
           
set @NotificationTypeID = @@IDENTITY
END
