CREATE VIEW [dbo].[GetAllDocumentsJobsVersions]
AS
SELECT     dbo.DocumentsJobsVersions.ID, dbo.DocumentsJobsVersions.DocID, dbo.DocumentsJobs.InquiryNumber, dbo.DocumentsJobs.DocName, 
                      dbo.DocumentsJobsVersions.DocumentData, dbo.DocumentsJobsVersions.VersionNo, dbo.DocumentsJobs.DocTypeID, dbo.DocumentsTypes.DocType, 
                      dbo.DocumentsJobsVersions.UserName, dbo.DocumentsJobsVersions.ModifiedDate, dbo.DocumentsJobsVersions.FileName
FROM         dbo.DocumentsJobs INNER JOIN
                      dbo.DocumentsTypes ON dbo.DocumentsJobs.DocTypeID = dbo.DocumentsTypes.ID INNER JOIN
                      dbo.DocumentsJobsVersions ON dbo.DocumentsJobs.ID = dbo.DocumentsJobsVersions.DocID
