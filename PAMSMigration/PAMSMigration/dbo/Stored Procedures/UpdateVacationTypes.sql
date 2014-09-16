CREATE PROCEDURE [dbo].[UpdateVacationTypes]
           @OldVacationTypeID int 
           ,@VacationTypeName nvarchar(50)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
AS
UPDATE [dbo].[VacationTypes]
   SET [VacationTypeName] = @VacationTypeName
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
 WHERE VacationTypeID = @OldVacationTypeID
