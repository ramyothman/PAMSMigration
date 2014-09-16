CREATE PROCEDURE [dbo].[UpdateReportTemplate]
    @Description nvarchar(500),
    @IsMain bit,
    @Name nvarchar(50),
    @ReportContent image,
    @OldReportTemplateID int,
    @ReportTypeID int
AS
UPDATE [dbo].[ReportTemplate]
SET
    Description = @Description,
    IsMain = @IsMain,
    Name = @Name,
    ReportContent = @ReportContent,
    ReportTypeID = @ReportTypeID
WHERE [ReportTemplateID] = @OLDReportTemplateID
IF @@ROWCOUNT > 0
Select * From ReportTemplate 
Where [ReportTemplateID] = @OLDReportTemplateID
