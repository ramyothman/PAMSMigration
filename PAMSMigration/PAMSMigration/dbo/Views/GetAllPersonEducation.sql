/****** Object:  View [dbo].[GetAllPersonEducation]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllPersonEducation]
AS
SELECT     Person.PersonEducation.PersonEducationId, Person.PersonEducation.PersonId, Person.PersonEducation.InstitutionName, Person.PersonEducation.Degree, 
                      Person.PersonEducation.StartDate, Person.PersonEducation.GraduationDate, Person.PersonEducation.FinalGrade, Person.PersonEducation.EducationTypeID, 
                      Person.EducationType.EducationTypeName
FROM         Person.PersonEducation LEFT OUTER JOIN
                      Person.EducationType ON Person.PersonEducation.EducationTypeID = Person.EducationType.EducationTypeId
