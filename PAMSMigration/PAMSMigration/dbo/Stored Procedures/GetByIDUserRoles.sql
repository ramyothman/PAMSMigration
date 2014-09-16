CREATE PROCEDURE [dbo].[GetByIDUserRoles]
    @ID int
AS
BEGIN
Select *
From [dbo].[UserRoles]
WHERE [ID] = @ID
END
