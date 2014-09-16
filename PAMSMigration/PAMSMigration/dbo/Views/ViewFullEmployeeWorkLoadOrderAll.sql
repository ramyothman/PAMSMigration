CREATE VIEW [dbo].[ViewFullEmployeeWorkLoadOrderAll]
AS
SELECT     dbo.ViewEmployeeWorkLoadOrderAll.ResponsibleEngineerID, dbo.ViewEmployeeWorkLoadOrderAll.InquiryNumbers, 
                      dbo.ViewEmployeeWorkLoadOrderAll.PointsInquiry, dbo.ViewEmployeeWorkLoadOrderAll.OrderQuotationPriceSum, 
                      dbo.ViewEmployeeWorkLoadOrderAll.PointsValueSum, dbo.ViewEmployeeWorkLoadOrderAll.PointsSum * 100 AS PointsSum, Person.PersonLanguages.LanguageId, 
                      Person.PersonLanguages.DisplayName, 
                      Person.PersonLanguages.FirstName + N' ' + Person.PersonLanguages.MiddleName + N' ' + Person.PersonLanguages.LastName AS Name, 
                      dbo.ViewEmployeeWorkLoadOrderAll.BranchID
FROM         dbo.ViewEmployeeWorkLoadOrderAll INNER JOIN
                      Person.PersonLanguages ON dbo.ViewEmployeeWorkLoadOrderAll.ResponsibleEngineerID = Person.PersonLanguages.PersonId
