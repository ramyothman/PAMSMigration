CREATE PROCEDURE [dbo].[GetByIDReportType]
    @ReportTypeID int
AS
BEGIN
Select ReportName, ReportTypeID
From [dbo].[ReportType]
WHERE [ReportTypeID] = @ReportTypeID
END
