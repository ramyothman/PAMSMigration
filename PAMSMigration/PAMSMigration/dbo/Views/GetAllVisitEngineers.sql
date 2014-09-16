/****** Object:  View [dbo].[GetAllVisitEngineers]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllVisitEngineers]
AS
SELECT     dbo.VisitEngineers.ID, dbo.VisitEngineers.VisitID, dbo.VisitEngineers.ResponsibleEngineerID, dbo.VisitEngineers.UserName, dbo.VisitEngineers.ModifiedDate, 
                      Person.PersonLanguages.DisplayName, Person.PersonLanguages.FirstName + N' ' + Person.PersonLanguages.MiddleName AS Expr1, 
                      Person.PersonLanguages.LanguageId
FROM         dbo.VisitEngineers INNER JOIN
                      Person.PersonLanguages ON dbo.VisitEngineers.ResponsibleEngineerID = Person.PersonLanguages.PersonId
WHERE     (Person.PersonLanguages.LanguageId = 1)
