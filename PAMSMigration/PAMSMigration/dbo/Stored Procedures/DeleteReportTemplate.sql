CREATE PROCEDURE [dbo].[DeleteReportTemplate]
    @ReportTemplateID int
AS
Begin
 Delete [dbo].[ReportTemplate] where     [ReportTemplateID] = @ReportTemplateID
End
