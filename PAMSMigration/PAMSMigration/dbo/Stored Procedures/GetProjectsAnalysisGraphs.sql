-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetProjectsAnalysisGraphs]
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
@BranchID int
AS
BEGIN
-- Principle Lost Analysis
if @ReportType = 0
 execute [dbo].[GetPrincipleProjectsAnalysisGraphs] @PeriodNumber,@PeriodChoice,@Current,@InquiryStatus,
                                 @ID,@IsFromToChecked,@ChoosenFromDate,
                                 @ChoosenToDate,@BranchID
-- Client Lost Analysis                                 
else if @ReportType = 1
 execute [dbo].[GetClientsProjectsAnalysisGraphs] @PeriodNumber,@PeriodChoice,@Current,@InquiryStatus,
                                 @ID,@IsFromToChecked,@ChoosenFromDate,
                                 @ChoosenToDate,@BranchID
END
