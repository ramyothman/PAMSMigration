/****** Object:  View [dbo].[GetAllPersonsNotifications]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllPersonsNotifications]
AS
SELECT DISTINCT 
                         dbo.Notifications.NotificationTypeID, dbo.NotificationsTypes.NotificationType, dbo.Notifications.Notification, dbo.NotificationPersons.NotificationPersonID, 
                         dbo.NotificationPersons.NotificationID, dbo.NotificationPersons.PersonID, dbo.NotificationPersons.IsRead, dbo.NotificationPersons.UserName, 
                         dbo.NotificationPersons.ModifiedDate, Person.PersonLanguages.PersonId AS WriteNotificationPersonID, 
                         Person.PersonLanguages.LanguageId AS WriteNotificationLanguageID, Person.PersonLanguages.DisplayName AS WriteNotificationDisplayName, 
                         PersonLanguages_1.LanguageId, PersonLanguages_1.DisplayName, dbo.Notifications.RelatedID, dbo.Notifications.RelatedFormName, 
                         dbo.Notifications.ModifiedDate AS WriteNotificationModifiedDate, dbo.Notifications.UserName AS WriteNotificationUserName, dbo.Notifications.BranchID, 
                         dbo.CompanyBranches.BranchNameFL, dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID, dbo.CompanyCountries.CountryName, 
                         dbo.Projects.ProjectName
FROM            dbo.CompanyCountries RIGHT OUTER JOIN
                         dbo.CompanyBranches ON dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID RIGHT OUTER JOIN
                         dbo.Notifications ON dbo.Notifications.BranchID = dbo.CompanyBranches.ID INNER JOIN
                         Person.PersonLanguages ON Person.PersonLanguages.PersonId = dbo.Notifications.PersonID INNER JOIN
                         dbo.NotificationPersons ON dbo.Notifications.ID = dbo.NotificationPersons.NotificationID INNER JOIN
                         Person.PersonLanguages AS PersonLanguages_1 ON dbo.NotificationPersons.PersonID = PersonLanguages_1.PersonId INNER JOIN
                         dbo.Projects ON dbo.Notifications.RelatedID = dbo.Projects.ID INNER JOIN
                         dbo.NotificationsTypes ON dbo.Notifications.NotificationTypeID = dbo.NotificationsTypes.NotificationTypeID
WHERE        (PersonLanguages_1.LanguageId = 1) AND (Person.PersonLanguages.LanguageId = 1)
