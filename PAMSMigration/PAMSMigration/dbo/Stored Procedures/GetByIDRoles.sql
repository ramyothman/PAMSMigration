CREATE PROCEDURE [dbo].[GetByIDRoles]
    @ID int
AS
BEGIN
Select *
From [dbo].[Roles]
WHERE [ID] = @ID
END
