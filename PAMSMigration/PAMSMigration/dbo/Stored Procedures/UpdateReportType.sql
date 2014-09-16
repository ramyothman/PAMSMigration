CREATE PROCEDURE [dbo].[UpdateReportType]
    @ReportName nvarchar(50),
    @ReportTypeID int,
    @OldReportTypeID int
AS
UPDATE [dbo].[ReportType]
SET
    ReportName = @ReportName,
    ReportTypeID = @ReportTypeID
WHERE [ReportTypeID] = @OLDReportTypeID
IF @@ROWCOUNT > 0
Select * From ReportType 
Where [ReportTypeID] = @ReportTypeID
