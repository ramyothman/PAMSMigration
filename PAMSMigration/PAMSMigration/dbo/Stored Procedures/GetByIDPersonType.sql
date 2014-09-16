CREATE  PROCEDURE [dbo].[GetByIDPersonType]
    @PersonTypeId int
AS
BEGIN
Select *
From [Person].[PersonType]
WHERE [PersonTypeId] = @PersonTypeId
END
