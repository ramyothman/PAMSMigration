CREATE VIEW [dbo].[GetAllSystemPages]
AS
SELECT     dbo.SystemPages.ID, dbo.SystemPages.ModCode, dbo.SystemPages.PageName, dbo.SystemPages.Path, dbo.SystemPages.TabID, dbo.SystemPages.IsActive, 
                      dbo.SystemTabs.SystemTabName
FROM         dbo.SystemPages INNER JOIN
                      dbo.SystemTabs ON dbo.SystemPages.TabID = dbo.SystemTabs.ID
