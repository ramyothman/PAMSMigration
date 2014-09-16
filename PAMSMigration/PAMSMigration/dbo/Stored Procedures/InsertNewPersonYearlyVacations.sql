CREATE PROCEDURE [dbo].[InsertNewPersonYearlyVacations]
    @PersonID int,
    @Year int,
    @NumOfVacationsAnnual int,
    @NumOfVacationsCasual int,
    @BranchID int
AS
INSERT INTO [dbo].[PersonYearlyVacations] (
    [PersonID],
    [Year],
    [NumOfVacationsAnnual],
    [NumOfVacationsCasual],
    [BranchID])
Values (
    @PersonID,
    @Year,
    @NumOfVacationsAnnual,
    @NumOfVacationsCasual,
    @BranchID)
IF @@ROWCOUNT > 0
Select * from PersonYearlyVacations
Where [ID] = @@identity
