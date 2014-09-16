CREATE VIEW [dbo].[GetAllReportTemplate]
AS
SELECT        ReportTemplateID, Name, ReportTypeID, Description, IsMain
FROM            dbo.ReportTemplate
