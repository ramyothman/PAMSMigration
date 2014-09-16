-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date, 
-- Description:	@Description, 
-- =============================================
CREATE PROCEDURE [dbo].[UpdateNotifications]
            @OldID int 
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
UPDATE [dbo].[Notifications]
   SET [NotificationTypeID] = @NotificationTypeID
      ,[Notification] = @Notification
      ,[PersonID] = @PersonID
      ,[RelatedID] = @RelatedID
      ,[RelatedFormName] = @RelatedFormName
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
      ,[BranchID] = @BranchID
 WHERE ID = @OldID
END
