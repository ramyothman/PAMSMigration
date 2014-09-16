CREATE PROCEDURE [dbo].[UpdateVacationReportWay]
           @OldID int 
           ,@VacationReportWayName nvarchar(50)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
AS
UPDATE [dbo].[VacationReportWay]
   SET [VacationReportWayName] = @VacationReportWayName
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
 WHERE ID = @oldID
