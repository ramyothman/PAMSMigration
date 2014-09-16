CREATE PROCEDURE [dbo].[InsertNewEmployeeVacations]
           --@EmployeeVacationID int out,
            @PersonId int
           ,@VacationReportWayID int
           ,@VacationTypeId int
           ,@StartDate datetime
           ,@EndDate datetime
           ,@RequestDate datetime
           ,@ApprovedDate datetime
           ,@ApprovedPersonId int
           ,@IsApproved bit
           ,@Comment nvarchar(MAX)
           ,@NumOfDays numeric(18,1)
           ,@ModifiedDate datetime
           ,@UserName nvarchar(50)
AS
INSERT INTO [dbo].[EmployeeVacations]
           ([PersonId]
           ,[VacationTypeId]
           ,[VacationReportWayID]
           ,[StartDate]
           ,[EndDate]
           ,[RequestDate]
           ,[ApprovedDate]
           ,[ApprovedPersonId]
           ,[IsApproved]
           ,[Comment]
           ,[NumOfDays]
           ,[ModifiedDate]
           ,[UserName])
     VALUES
           (@PersonId
           ,@VacationTypeId
           ,@VacationReportWayID
           ,@StartDate
           ,@EndDate
           ,@RequestDate
           ,@ApprovedDate
           ,@ApprovedPersonId
           ,@IsApproved
           ,@Comment
           ,@NumOfDays
           ,@ModifiedDate
           ,@UserName)
--set @EmployeeVacationID = @@identity
IF @@ROWCOUNT > 0
Select * from [dbo].[EmployeeVacations]
Where [EmployeeVacationID] =@@identity
