CREATE PROCEDURE [dbo].[GetByIDPersonYearlyVacations]
    @ID int
AS
BEGIN
Select ID, PersonID, Year, NumOfVacationsAnnual, NumOfVacationsCasual, BranchID
From [dbo].[PersonYearlyVacations]
WHERE [ID] = @ID
END
