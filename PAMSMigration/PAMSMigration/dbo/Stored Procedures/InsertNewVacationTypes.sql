CREATE PROCEDURE [dbo].[InsertNewVacationTypes]
           -- @VacationTypeID int out ,
           @VacationTypeName nvarchar(50)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
AS
INSERT INTO [dbo].[VacationTypes]
           ([VacationTypeName]
           ,[UserName]
           ,[ModifiedDate])
     VALUES
           (@VacationTypeName
           ,@UserName
           ,@ModifiedDate)
           
-- select * from  [dbo].[VacationTypes] where VacationTypeID = @@IDENTITY        
----set @VacationTypeID = @@IDENTITY
IF @@ROWCOUNT > 0
Select * from ExpenseType
Where [ExpenseTypeID] = @@identity
