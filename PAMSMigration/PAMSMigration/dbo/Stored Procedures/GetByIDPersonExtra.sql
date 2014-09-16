CREATE  PROCEDURE [dbo].[GetByIDPersonExtra]
    @PersonId int
AS
BEGIN
Select * From [Person].[PersonExtra]
WHERE [PersonId] = @PersonId
END
