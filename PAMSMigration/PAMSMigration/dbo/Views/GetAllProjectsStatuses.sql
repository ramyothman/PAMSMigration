CREATE VIEW [dbo].[GetAllProjectsStatuses]
AS
SELECT     ID, ProjectStatus, UserName, ModifiedDate
FROM         dbo.ProjectsStatuses
