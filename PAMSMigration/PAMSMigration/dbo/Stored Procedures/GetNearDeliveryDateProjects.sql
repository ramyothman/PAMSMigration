-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetNearDeliveryDateProjects]
  @NumOfDays int,
  @ResponsibleEngineerID int,
  @IsAll bit,
  @BranchID int 
AS
BEGIN
declare @FromDate datetime
declare @ToDate datetime
declare @DayName nvarchar(15)
if(@NumOfDays >5)
  set @NumOfDays = @NumOfDays + (@NumOfDays / 5) * 2
else if(@NumOfDays = 5)
    set @NumOfDays = @NumOfDays + 2
  
set @FromDate = getdate()
set @NumOfDays = @NumOfDays +1
set  @ToDate = dateadd(day,@NumOfDays,@FromDate)
select @DayName = datename(dw,@ToDate)
if(@NumOfDays <5)
   if(@DayName = 'Firday'or @DayName = 'Saturday' )
       set @ToDate = dateadd(day,2,@ToDate)      
--select @DayName = datename(dw,@FromDate) 
print (@FromDate)
print(@ToDate)
print (@DayName)
--if(@DayName = 'Tuesday' or @DayName = 'Wednesday' or @DayName = 'Thursday')
--set @ToDate = dateadd(day,5,@FromDate)
--print(@ToDate)
 --if(@IsAll = 'True')
   SELECT *
   FROM [dbo].[ViewShotecProject]
   where BranchID = @BranchID and [ExpectedDeliveryDate]    between (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
										   (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) 
   order by [ExpectedDeliveryDate]
	
--else
--   SELECT *
--   FROM [dbo].[ViewShotecProject]
--   where [ResponsibleEngineer] = @ResponsibleEngineerID and [ExpectedDeliveryDate] between (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
--										   (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) 
--   order by [ExpectedDeliveryDate]
 
END
