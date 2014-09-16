-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[UpdateTwitterFollowers]
            @FollwerID int
           ,@UserID int        
           ,@IsAccepted bit
           ,@RequestDate datetime
           ,@AcceptanceDate datetime
           ,@FollowerTypeID int
           ,@RequestComment nvarchar(MAX)
           ,@ProjectInquiryNumber nvarchar(50)
	       ,@oldID int
 AS
BEGIN
UPDATE [dbo].[TwitterFollowers]
   SET [UserID] = @UserID
      ,[FollwerID] = @FollwerID
      ,[IsAccepted] = @IsAccepted
      ,[RequestDate] = @RequestDate
      ,[AcceptanceDate] = @AcceptanceDate
      ,[FollowerTypeID] = @FollowerTypeID
      ,[RequestComment] = @RequestComment
      ,[ProjectInquiryNumber] = @ProjectInquiryNumber
  WHERE ID = @oldID
END
