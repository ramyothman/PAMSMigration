CREATE PROCEDURE [dbo].[UpdateVisitPurposes]
            @OldId int
           ,@VisitID int
           ,@Reason nvarchar(255)
           ,@AchivmentID int
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
AS
UPDATE [dbo].[VisitPurposes]
   SET [VisitID] = @VisitID
      ,[Reason] = @Reason
      ,[AchivmentID] = @AchivmentID
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
 WHERE ID = @OldId
