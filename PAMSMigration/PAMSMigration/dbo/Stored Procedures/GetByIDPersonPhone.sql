CREATE  PROCEDURE [dbo].[GetByIDPersonPhone]
    @PersonPhoneId int
AS
BEGIN
Select * From [Person].[PersonPhone]
WHERE [PersonPhoneId] = @PersonPhoneId
END
