CREATE PROCEDURE [dbo].[UpdateVisitEngineers]
            @OldId int
           ,@VisitID int
           ,@ResponsibleEngineerID int
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
AS
UPDATE [dbo].[VisitEngineers]
   SET [VisitID] = @VisitID
      ,[ResponsibleEngineerID] = @ResponsibleEngineerID
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
 WHERE ID = @OldId
