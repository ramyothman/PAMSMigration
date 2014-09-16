-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date, 
-- Description:	@Description, 
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewNotifications]
            @ID int out
	       ,@NotificationTypeID int
           ,@Notification nvarchar(max)
           ,@PersonID int
           ,@RelatedID int 
           ,@RelatedFormName nvarchar(500)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
           ,@BranchID int
AS
BEGIN
INSERT INTO [dbo].[Notifications]
           ([NotificationTypeID]
           ,[Notification]
           ,[PersonID]
           ,[RelatedFormName]
           ,[RelatedID]
           ,[UserName]
           ,[ModifiedDate]
           ,[BranchID])
     VALUES
           (@NotificationTypeID
           ,@Notification
           ,@PersonID
           ,@RelatedFormName
           ,@RelatedID
           ,@UserName
           ,@ModifiedDate
           ,@BranchID)
set @ID = @@IDENTITY
   
END
