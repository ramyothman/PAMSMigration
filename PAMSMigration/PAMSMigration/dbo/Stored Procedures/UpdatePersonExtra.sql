CREATE  PROCEDURE [dbo].[UpdatePersonExtra]
            @PersonID int
           ,@NationalityCode char(3)
           ,@Gender nchar(1)
           ,@Religion nvarchar(50)
           ,@BirthDate datetime
           ,@BirthPlace nvarchar(50)
           ,@MaritalStatus nvarchar(50)
           ,@SpauseName nvarchar(50)
           ,@EmergencyContactName nvarchar(150)
           ,@EmergencyContactAddress nvarchar(250)
           ,@EmergencyContactNumber nvarchar(50)
           ,@EmergencyContactEmail nvarchar(150)
           ,@HireDate datetime
           ,@LeaveDate datetime
           ,@IsResponsibleEngineer bit
           ,@Position nvarchar(50)
           ,@Salary money
           ,@SalaryCurrencyID int
           ,@ManagerId int
           ,@OfferApprove bit
           ,@OfferPrepare bit
           ,@OtherInformation ntext
           ,@NumOfVacation int
           ,@EmployeeTypeID int
           ,@BranchID int
AS
UPDATE [Person].[PersonExtra]
   SET [PersonID] = @PersonID
      ,[NationalityCode] = @NationalityCode
      ,[Gender] = @Gender
      ,[Religion] = @Religion
      ,[BirthDate] = @BirthDate
      ,[BirthPlace] = @BirthPlace
      ,[MaritalStatus] = @MaritalStatus
      ,[SpauseName] = @SpauseName
      ,[EmergencyContactName] = @EmergencyContactName
      ,[EmergencyContactAddress] = @EmergencyContactAddress
      ,[EmergencyContactNumber] = @EmergencyContactNumber
      ,[EmergencyContactEmail] = @EmergencyContactEmail
      ,[HireDate] = @HireDate
      ,[LeaveDate] = @LeaveDate
      ,[IsResponsibleEngineer] = @IsResponsibleEngineer
      ,[Position] = @Position
      ,[Salary] = @Salary
      ,[SalaryCurrencyID] = @SalaryCurrencyID
      ,[ManagerId] = @ManagerId
      ,[OfferApprove] = @OfferApprove
      ,[OfferPrepare] = @OfferPrepare
      ,[OtherInformation] = @OtherInformation
      ,[NumOfVacation] = @NumOfVacation
      ,[EmployeeTypeID] = @EmployeeTypeID
      ,[BranchID] = @BranchID
WHERE [PersonID] = @PersonID
IF @@ROWCOUNT > 0
Select * From Person.PersonExtra 
Where [PersonID] = @PersonID
