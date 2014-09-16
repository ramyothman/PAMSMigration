CREATE PROCEDURE [dbo].[UpdatePersonYearlyVacations]
    @OldID int,
    @PersonID int,
    @Year int,
    @NumOfVacationsAnnual int,
    @NumOfVacationsCasual int,
    @BranchID int
AS
UPDATE [dbo].[PersonYearlyVacations]
SET
    PersonID = @PersonID,
    Year = @Year,
    NumOfVacationsAnnual = @NumOfVacationsAnnual,
    NumOfVacationsCasual = @NumOfVacationsCasual,
    BranchID = @BranchID
WHERE [ID] = @OLDID
IF @@ROWCOUNT > 0
Select * From PersonYearlyVacations 
Where [ID] = @OLDID
