-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetInquiriesForPeriod]
	@FromDate Datetime,
	@ToDate Datetime,
	@BranchID int
AS
declare @where nvarchar(max)=' Where BranchID =' + cast(@BranchID  as nvarchar(10)) + ' and ProjectStatus = ''INQUIRY'' AND InquiryDate is not null and
	 InquiryDate Between (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+ cast(@FromDate  as nvarchar(24))+ '''))) and 
								   (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,''' + cast(@ToDate as nvarchar(24))  + '''))) AND
	 (IsSubOffer =''false'' or IsSubOffer is null)'
BEGIN
exec	GetViewShotecProject @where

	 --select * from ViewShotecProject 
	 --Where ProjectStatus = 'INQUIRY' AND BranchID = @BranchID and
	 --InquiryDate Between (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
		--						   (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) AND
	 --(IsSubOrder ='false' or IsSubOrder is null )
END
