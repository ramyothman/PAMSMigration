/****** Object:  View [dbo].[GetAllNotifications]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllNotifications]
AS
SELECT        dbo.Notifications.ID, dbo.Notifications.Notification, dbo.Notifications.NotificationTypeID, dbo.NotificationsTypes.NotificationType, dbo.Notifications.UserName,
                          dbo.Notifications.ModifiedDate, Person.PersonLanguages.LanguageId, Person.PersonLanguages.DisplayName, dbo.Notifications.RelatedFormName, 
                         dbo.Notifications.RelatedID, dbo.Notifications.BranchID, dbo.CompanyBranches.BranchNameFL, dbo.CompanyBranches.BranchNameSL, 
                         dbo.CompanyBranches.CountryID, dbo.CompanyCountries.CountryName, dbo.Notifications.PersonID
FROM            dbo.CompanyCountries INNER JOIN
                         dbo.CompanyBranches ON dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND 
                         dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND 
                         dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND 
                         dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID INNER JOIN
                         dbo.Notifications INNER JOIN
                         dbo.NotificationsTypes ON dbo.Notifications.NotificationTypeID = dbo.NotificationsTypes.NotificationTypeID INNER JOIN
                         Person.PersonLanguages ON dbo.Notifications.PersonID = Person.PersonLanguages.PersonId ON 
                         dbo.CompanyBranches.ID = dbo.Notifications.BranchID
WHERE        (Person.PersonLanguages.LanguageId = 1)
