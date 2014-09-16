CREATE PROCEDURE [dbo].[GetByIDReportTemplate]
    @ReportTemplateID int
AS
BEGIN
Select Description, IsMain, Name, ReportContent, ReportTemplateID, ReportTypeID
From [dbo].[ReportTemplate]
WHERE [ReportTemplateID] = @ReportTemplateID
END
