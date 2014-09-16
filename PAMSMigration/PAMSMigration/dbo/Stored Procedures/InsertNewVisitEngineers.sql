CREATE PROCEDURE [dbo].[InsertNewVisitEngineers]
            @VisitID int
           ,@ResponsibleEngineerID int
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
AS
INSERT INTO [dbo].[VisitEngineers]
           ([VisitID]
           ,[ResponsibleEngineerID]
           ,[UserName]
           ,[ModifiedDate])
     VALUES
           (@VisitID
           ,@ResponsibleEngineerID
           ,@UserName
           ,@ModifiedDate)
IF @@ROWCOUNT > 0
Select * from VisitEngineers
Where [ID] = @@identity
