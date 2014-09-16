-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetLostAnalysisGraphs]
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
@IsOffer bit,
@BranchID int
AS
BEGIN
-- Principle Lost Analysis
if @ReportType = 0
 execute [dbo].[GetPrincipleLostAnalysisGraphs] @PeriodNumber,@PeriodChoice,@Current,@InquiryStatus,
                                 @ID,@IsFromToChecked,@ChoosenFromDate,
                                 @ChoosenToDate,@IsOffer, @BranchID
-- Client Lost Analysis                                 
else if @ReportType = 1
 execute [dbo].[GetClientLostAnalysisGraphs] @PeriodNumber,@PeriodChoice,@Current,@InquiryStatus,
                                 @ID,@IsFromToChecked,@ChoosenFromDate,
                                 @ChoosenToDate,@IsOffer, @BranchID
END
