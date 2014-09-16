CREATE PROCEDURE [dbo].[GetByPersonIDPersonsBranchesDefault]
    @PersonID int
AS
BEGIN
Select *
From [dbo].[PersonsBranches]
WHERE PersonID = @PersonID and DefaultBranch = 'True'
END
