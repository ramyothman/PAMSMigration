-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetProjectsDataReport]
@PeriodNumber int,
@PeriodChoice int,
@Current bit,
@ID int,
@ProjectStatus nvarchar(50),
@IsFromToChecked bit,
@ChoosenFromDate datetime,
@ChoosenToDate datetime,
@ReportType int,
@BranchID int
AS
BEGIN
-- Principle Lost Analysis
if @ReportType = 0
 execute [dbo].[GetPrincipleProjectsDataReport] @PeriodNumber,@PeriodChoice,@Current,
                                 @ID,@ProjectStatus,@IsFromToChecked,@ChoosenFromDate,
                                 @ChoosenToDate,@BranchID
-- Client Lost Analysis                                 
else if @ReportType = 1
 execute [dbo].[GetClientProjectsDataReport] @PeriodNumber,@PeriodChoice,@Current,
                                 @ID,@ProjectStatus,@IsFromToChecked,@ChoosenFromDate,
                                 @ChoosenToDate, @BranchID
END
