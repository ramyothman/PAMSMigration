-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetGoodsPaidForPeriod]
	@FromDate Datetime,
	@ToDate Datetime,
	@BranchID int
AS
BEGIN
	 select * from ViewShotecProject 
	 Where ProjectStatus = 'GoodsPaid' AND BranchID = @BranchID and  
	 CompletedGoodsPaidON Between (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
								   (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate)))
END
