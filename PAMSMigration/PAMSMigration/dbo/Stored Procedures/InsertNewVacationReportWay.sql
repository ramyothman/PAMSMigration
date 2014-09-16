CREATE PROCEDURE [dbo].[InsertNewVacationReportWay]
           -- @VacationTypeID int out
          @VacationReportWayName nvarchar(50)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
AS
INSERT INTO [dbo].[VacationReportWay]
           ([VacationReportWayName]
           ,[UserName]
           ,[ModifiedDate])
     VALUES
           (@VacationReportWayName
           ,@UserName
           ,@ModifiedDate)
           
 select * from  [dbo].[VacationReportWay] where ID = @@IDENTITY        
--set @VacationTypeID = @@IDENTITY
