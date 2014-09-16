CREATE VIEW [dbo].[GetAllManagmentVacations]
AS
SELECT     PersonId, DisplayName, NumOfVacation, VacationTypeId, VacationTypeName, YEAR(StartDate) AS VacationYear, CAST(dbo.GetTotalEmployeeVacations(PersonId, 
                      YEAR(StartDate)) AS decimal(18, 1)) AS TotalDays, CAST(dbo.GetRemainEmployeeVacations(PersonId, YEAR(StartDate)) AS decimal(18, 1)) AS RemainDays, 
                      ISNULL(CAST(dbo.GetRemainEmployeeVacationsFromPreviousYears(PersonId, YEAR(StartDate)) AS decimal(18, 1)), 0) AS RemainDaysPrev, 
                      CAST(dbo.GetRemainEmployeeVacations(PersonId, YEAR(StartDate)) AS decimal(18, 1)) 
                      + ISNULL(CAST(dbo.GetRemainEmployeeVacationsFromPreviousYears(PersonId, YEAR(StartDate)) AS decimal(18, 1)), 0) AS TotalRemainDays, SUM(NumOfDays) 
                      AS VacationDays, BranchID, BranchNameFL
FROM         (SELECT DISTINCT dbo.EmployeeVacations.PersonId, dbo.GetAllPersons.DisplayName, ISNULL
                                                  ((SELECT     SUM(NumOfVacationsAnnual + NumOfVacationsCasual) AS Expr1
                                                      FROM          dbo.PersonYearlyVacations
                                                      WHERE      (Year = YEAR(dbo.EmployeeVacations.StartDate) OR
                                                                             Year = YEAR(dbo.EmployeeVacations.EndDate)) AND (dbo.EmployeeVacations.PersonId = PersonID)), 0) AS NumOfVacation, 
                                              dbo.GetAllPersons.NumOfVacation AS NumOfVacations, dbo.EmployeeVacations.VacationTypeId, dbo.EmployeeVacations.StartDate, 
                                              dbo.VacationTypes.VacationTypeName, dbo.EmployeeVacations.NumOfDays, dbo.GetAllPersons.BranchID, dbo.GetAllPersons.BranchNameFL
                        FROM         dbo.EmployeeVacations INNER JOIN
                                              dbo.VacationTypes ON dbo.EmployeeVacations.VacationTypeId = dbo.VacationTypes.VacationTypeId INNER JOIN
                                              dbo.GetAllPersons ON dbo.EmployeeVacations.PersonId = dbo.GetAllPersons.BusinessEntityId) AS t
GROUP BY PersonId, DisplayName, NumOfVacation, VacationTypeId, YEAR(StartDate), VacationTypeName, BranchID, BranchNameFL
