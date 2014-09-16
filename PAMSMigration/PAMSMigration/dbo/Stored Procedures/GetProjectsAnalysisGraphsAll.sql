-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetProjectsAnalysisGraphsAll]
	-- Add the parameters for the stored procedure here
@PeriodNumber int,
@PeriodChoice int,
@Current bit,
@ID int,
@IsFromToChecked bit,
@ChoosenFromDate datetime,
@ChoosenToDate datetime,
@ReportType int,
@BranchID int
AS
BEGIN
-- Principle Lost Analysis
if @ReportType = 0
 execute [dbo].[GetPrincipleProjectsAnalysisGraphsAll] @PeriodNumber,@PeriodChoice,@Current,
                                 @ID,@IsFromToChecked,@ChoosenFromDate,
                                 @ChoosenToDate,@BranchID
-- Client Lost Analysis                                 
else if @ReportType = 1
 execute [dbo].[GetClientProjectsAnalysisGraphsAll] @PeriodNumber,@PeriodChoice,@Current,
                                 @ID,@IsFromToChecked,@ChoosenFromDate,
                                 @ChoosenToDate,@BranchID
END
