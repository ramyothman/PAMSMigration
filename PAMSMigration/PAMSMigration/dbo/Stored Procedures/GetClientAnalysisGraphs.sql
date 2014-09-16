-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetClientAnalysisGraphs]
	-- Add the parameters for the stored procedure here
@PeriodNumber int,
@PeriodChoice int,
@Current bit,
@InquiryStatus nvarchar(50),
@ID int,
@SelectedIDs nvarchar(Max),
@IsFromToChecked bit,
@ChoosenFromDate datetime,
@ChoosenToDate datetime,
@ReportType int,
@ChoosenProductTypes nvarchar(255),
@BranchID int
AS
BEGIN
-- Principle Client Analysis
if @ReportType = 0
 execute [dbo].[GetPrincipleClientAnalysisGraph] @PeriodNumber,@PeriodChoice,@Current,@InquiryStatus,
                                 @ID,@SelectedIDs,@IsFromToChecked,@ChoosenFromDate,
                                 @ChoosenToDate,@ChoosenProductTypes,@BranchID
-- Client Supplier Analysis                                 
else if @ReportType = 1
 execute [dbo].[GetClientSupplierAnalysisGraph] @PeriodNumber,@PeriodChoice,@Current,@InquiryStatus,
                                 @ID,@SelectedIDs,@IsFromToChecked,@ChoosenFromDate,
                                 @ChoosenToDate,@ChoosenProductTypes,@BranchID
END
