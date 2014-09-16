CREATE VIEW [dbo].[GetAllUsersProjectsLog]
AS
SELECT     dbo.ProjectsLog.ProjectID, dbo.UsersProjectsLog.ProjectLogID, dbo.ProjectsLog.VersionNumber, dbo.ProjectsLog.UserName, dbo.ProjectsLog.ModifiedDate, 
                      dbo.UsersProjectsLog.IsViewed, dbo.UsersProjectsLog.ViewedDate, dbo.ProjectsLog.SerializeObject, dbo.UsersProjectsLog.UserID
FROM         dbo.ProjectsLog INNER JOIN
                      dbo.UsersProjectsLog ON dbo.ProjectsLog.ID = dbo.UsersProjectsLog.ProjectLogID
