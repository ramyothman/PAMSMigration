-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetLostsForPeriod]
	@FromDate Datetime,
	@ToDate Datetime,
	@ProjectStatus nvarchar(50),
	@BranchID int
AS
declare @where nvarchar(max)=' Where BranchID = ' + cast(@BranchID  as nvarchar(10)) + '   AND Losts.ModifiedDate is not null and
	 Losts.ModifiedDate Between (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+ cast(@FromDate  as nvarchar(24))+ '''))) and 
								   (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,''' + cast(@ToDate as nvarchar(24))  + '''))) AND
	 (IsSubOffer =''false'' or IsSubOffer is null) and ProjectStatus ='+ @ProjectStatus + ' '
BEGIN
exec	GetViewShotecProject @where

--BEGIN
--	declare @sql nvarchar(1000)
--	set @sql = 'Select * from ViewShotecProject 
--	 Where ProjectStatus = '+@ProjectStatus + ' AND BranchID = ' + Convert(nvarchar(5),@BranchID) 
--	 +' AND LostDate Between (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, ''' +CONVERT(nvarchar(30), @FromDate,100) +''')))  and  
--								   (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,'''+ CONVERT(nvarchar(30),@ToDate,100) +''')))
--								    AND (IsSubLost =''false'' or IsSubLost is null )'  
	
--	-- 'Lost'' or ProjectStatus = ''UnQuotedLost'') '+
--	 --+ ' and LostReasonCode in ('+@LostReasons+')'
--	 print (@sql)
	 
--	 EXEC (@sql) 
END
/****** Object:  UserDefinedFunction [dbo].[GetLostType]    Script Date: 05/12/2011 12:04:20 ******/
SET ANSI_NULLS ON
