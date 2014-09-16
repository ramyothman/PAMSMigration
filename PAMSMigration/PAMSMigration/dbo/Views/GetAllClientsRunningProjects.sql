/****** Object:  View [dbo].[GetAllClientsRunningProjects]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllClientsRunningProjects]
AS
SELECT     ID, ProjectCode, ProjectName, '' AS Type, EngineeringByID, ProcurementByID, ContractorID, OwnerID, ProjectStatusID, BranchID, IsGeneral
FROM         dbo.Projects
