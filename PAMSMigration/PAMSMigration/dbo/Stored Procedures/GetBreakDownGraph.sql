-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetBreakDownGraph]
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
	-- Principle Client Analysis
if @ReportType = 0
 execute [dbo].[GetPrincipleBreakDownGraph] @PeriodNumber,@PeriodChoice,@Current,@InquiryStatus,
                                 @ID,@IsFromToChecked,@ChoosenFromDate,
                                 @ChoosenToDate,@BranchID
-- Client Supplier Analysis                                 
else if @ReportType = 1
 execute [dbo].[GetClientBreakDownGraph] @PeriodNumber,@PeriodChoice,@Current,@InquiryStatus,
                                 @ID,@IsFromToChecked,@ChoosenFromDate,
                                 @ChoosenToDate,@BranchID
END
