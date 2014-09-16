CREATE  PROCEDURE [dbo].[InsertNewPersonExtra]
            @PersonID int
           ,@NationalityCode char(3)
           ,@Gender nchar(1)
           ,@Religion nvarchar(50)
           ,@BirthDate datetime
           ,@BirthPlace nvarchar(50)
           ,@MaritalStatus nvarchar(50)
           ,@SpauseName nvarchar(50)
           ,@HireDate datetime
           ,@LeaveDate datetime
            ,@IsResponsibleEngineer bit
           ,@EmergencyContactName nvarchar(150)
           ,@EmergencyContactAddress nvarchar(250)
           ,@EmergencyContactNumber nvarchar(50)
           ,@EmergencyContactEmail nvarchar(150)   
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


    delete  from  Person.PersonExtra 
    Where [PersonID] = @PersonID 



INSERT INTO [Person].[PersonExtra]
           ([PersonID]
           ,[NationalityCode]
           ,[Gender]
           ,[Religion]
           ,[BirthDate]
           ,[BirthPlace]
           ,[MaritalStatus]
           ,[SpauseName]
           ,[EmergencyContactName]
           ,[EmergencyContactAddress]
           ,[EmergencyContactNumber]
           ,[EmergencyContactEmail]
           ,[HireDate]
           ,[LeaveDate]
           ,[IsResponsibleEngineer]
           ,[Position]
           ,[Salary]
           ,[SalaryCurrencyID]
           ,[ManagerId]
           ,[OfferApprove]
           ,[OfferPrepare]
           ,[OtherInformation]
           ,[NumOfVacation]
           ,[EmployeeTypeID]
           ,[BranchID])
     VALUES
           (@PersonID
           ,@NationalityCode
           ,@Gender
           ,@Religion
           ,@BirthDate
           ,@BirthPlace
           ,@MaritalStatus
           ,@SpauseName
           ,@EmergencyContactName
           ,@EmergencyContactAddress
           ,@EmergencyContactNumber
           ,@EmergencyContactEmail
           ,@HireDate
           ,@LeaveDate
           ,@IsResponsibleEngineer
           ,@Position
           ,@Salary
           ,@SalaryCurrencyID
           ,@ManagerId
           ,@OfferApprove
           ,@OfferPrepare
           ,@OtherInformation
           ,@NumOfVacation
           ,@EmployeeTypeID
           ,@BranchID)
            
           
IF @@ROWCOUNT > 0
Select * from Person.PersonExtra
Where [PersonID] = @PersonID
