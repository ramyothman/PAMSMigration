-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCompletedForPeriod]
	@FromDate Datetime,
	@ToDate Datetime,
	@BranchID int
AS
BEGIN
	 select * from ViewShotecProject 
	 Where ProjectStatus = 'Completed' AND BranchID = @BranchID and
	 (AllCommssionPaidDate Between (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
								   (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate)))) OR
	(GuaranteesClosedDate Between (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
								   (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))))				   
END
