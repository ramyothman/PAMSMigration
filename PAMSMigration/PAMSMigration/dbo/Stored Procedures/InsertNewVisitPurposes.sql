CREATE PROCEDURE [dbo].[InsertNewVisitPurposes]
            @VisitID int
           ,@Reason nvarchar(255)
           ,@AchivmentID int
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
AS
INSERT INTO [dbo].[VisitPurposes]
           ([VisitID]
           ,[Reason]
           ,[AchivmentID]
           ,[UserName]
           ,[ModifiedDate])
     VALUES
           (@VisitID
           ,@Reason
           ,@AchivmentID
           ,@UserName
           ,@ModifiedDate)
IF @@ROWCOUNT > 0
Select * from VisitPurposes
Where [ID] = @@identity
