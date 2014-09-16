CREATE PROCEDURE [dbo].[DeleteReportType]
    @ReportTypeID int
AS
Begin
 Delete [dbo].[ReportType] where     [ReportTypeID] = @ReportTypeID
End
