CREATE PROCEDURE [dbo].[InsertNewReportType]
    @ReportName nvarchar(50),
    @ReportTypeID int
AS
INSERT INTO [dbo].[ReportType] (
    [ReportName],
    [ReportTypeID])
Values (
    @ReportName,
    @ReportTypeID)
IF @@ROWCOUNT > 0
Select * from ReportType
Where [ReportTypeID] = @ReportTypeID
