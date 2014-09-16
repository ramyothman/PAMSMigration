CREATE PROCEDURE [dbo].[GetByIDPersonsBranches]
    @ID int
AS
BEGIN
Select *
From [dbo].[PersonsBranches]
WHERE ID = @ID
END
