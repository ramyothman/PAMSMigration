CREATE PROCEDURE [dbo].[InsertNewTwitterFollowers]
           
           @FollwerID int
           ,@UserID int        
           ,@IsAccepted bit
           ,@RequestDate datetime
           ,@AcceptanceDate datetime
           ,@FollowerTypeID int
           ,@RequestComment nvarchar(MAX)
           ,@ProjectInquiryNumber nvarchar(50)
AS
INSERT INTO [dbo].[TwitterFollowers]
           ([UserID]
           ,[FollwerID]
           ,[IsAccepted]
		   ,[RequestDate]
		   ,[AcceptanceDate]
		   ,[FollowerTypeID]
		   ,[RequestComment]
		   ,[ProjectInquiryNumber])
     VALUES
           (@UserID
           ,@FollwerID
           ,@IsAccepted
           ,@RequestDate
           ,@AcceptanceDate
           ,@FollowerTypeID,
           @RequestComment,
           @ProjectInquiryNumber)
IF @@ROWCOUNT > 0
Select * from [dbo].[TwitterFollowers]
Where [ID] = @@identity
