CREATE PROCEDURE [dbo].[GetByIDUsers]
    @ID int
AS
BEGIN
Select *
From [dbo].[Users]
WHERE [ID] = @ID
END
