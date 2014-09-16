CREATE PROCEDURE [dbo].[InsertNewReportTemplate]
    @Description nvarchar(500),
    @IsMain bit,
    @Name nvarchar(50),
    @ReportContent image,
    @ReportTypeID int
AS
INSERT INTO [dbo].[ReportTemplate] (
    [Description],
    [IsMain],
    [Name],
    [ReportContent],
    [ReportTypeID])
Values (
    @Description,
    @IsMain,
    @Name,
    @ReportContent,
    @ReportTypeID)
IF @@ROWCOUNT > 0
Select * from ReportTemplate
Where [ReportTemplateID] = @@identity
