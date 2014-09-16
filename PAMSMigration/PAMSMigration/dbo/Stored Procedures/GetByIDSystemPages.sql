CREATE PROCEDURE [dbo].[GetByIDSystemPages]
    @ID int
AS
BEGIN
Select *
From [dbo].[SystemPages]
WHERE [ID] = @ID
END
