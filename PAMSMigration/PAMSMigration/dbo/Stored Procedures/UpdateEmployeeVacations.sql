CREATE PROCEDURE [dbo].[UpdateEmployeeVacations]
           @OldEmployeeVacationID int out
           ,@PersonId int
           ,@VacationTypeId int
           ,@VacationReportWayID int
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
UPDATE [dbo].[EmployeeVacations]
   SET [PersonId] = @PersonId
      ,[VacationTypeId] = @VacationTypeId
      ,[VacationReportWayID] = @VacationReportWayID
      ,[StartDate] = @StartDate
      ,[EndDate] = @EndDate
      ,[RequestDate] = @RequestDate
      ,[ApprovedDate] = @ApprovedDate
      ,[ApprovedPersonId] = @ApprovedPersonId
      ,[IsApproved] = @IsApproved
      ,[Comment] = @Comment
      ,[NumOfDays] = @NumOfDays
      ,[ModifiedDate] = @ModifiedDate
      ,[UserName] = @UserName
 WHERE EmployeeVacationID = @OldEmployeeVacationID
