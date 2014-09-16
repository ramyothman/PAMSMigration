-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetProjectsAnalysisGraphsYearlyHistory]
	-- Add the parameters for the stored procedure here
@PeriodNumber int,
@PeriodChoice int,
@Current bit,
@InquiryStatus nvarchar(50),
@ID int,
@IsFromToChecked bit,
@ChoosenFromDate datetime,
@ChoosenToDate datetime,
@ReportType int,
@Year int,
@BranchID int
AS
BEGIN
-- Principle Lost Analysis
if @ReportType = 0
 execute [dbo].[GetPrincipleProjectsAnalysisGraphsYearlyHistory] @PeriodNumber,@PeriodChoice,@Current,@InquiryStatus,
                                 @ID,@IsFromToChecked,@ChoosenFromDate,
                                 @ChoosenToDate,@Year,@BranchID
-- Client Lost Analysis                                 
else if @ReportType = 1
 execute [dbo].[GetClientsProjectsAnalysisGraphs] @PeriodNumber,@PeriodChoice,@Current,@InquiryStatus,
                                 @ID,@IsFromToChecked,@ChoosenFromDate,
                                 @ChoosenToDate,@BranchID
END
