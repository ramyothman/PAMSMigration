-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetDeliveredForPeriod]
	@FromDate Datetime,
	@ToDate Datetime,
	@BranchID int
AS


declare @where nvarchar(max)=' Where BranchID =' + cast(@BranchID  as nvarchar(10)) + ' and ProjectStatus = ''Delivered'' AND DeliveredOn is not null and
	 DeliveredOn Between (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+ cast(@FromDate  as nvarchar(24))+ '''))) and 
								   (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,''' + cast(@ToDate as nvarchar(24))  + '''))) AND
	 (IsSubOffer =''false'' or IsSubOffer is null)'
BEGIN
exec	GetViewShotecProject @where

--BEGIN
--	 select * from ViewShotecProject 
--	 Where ProjectStatus = 'Delivered' AND BranchID = @BranchID and
--	 DeliveredOn Between (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
--								   (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate)))
END
