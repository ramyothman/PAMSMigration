CREATE PROCEDURE [dbo].[GetByIDSystemFunctions]
    @ID int
AS
BEGIN
Select *
From [dbo].[SystemFunctions]
WHERE [ID] = @ID
END
