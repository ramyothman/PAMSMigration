-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPrincipleBackLogGraphs]
	-- Add the parameters for the stored procedure here
@PeriodNumber int,
@PeriodChoice int,
@Current bit,
@InquiryStatus nvarchar(50),
@SupplierID int,
@IsFromToChecked bit,
@ChoosenFromDate datetime,
@ChoosenToDate datetime,
@BranchID int
AS
BEGIN
declare  @d datetime 
declare @FromDate as datetime
declare @ToDate as datetime
DECLARE @selectedDate nvarchar(50)
declare @TempToDate datetime 
declare @TempFromDate datetime 
declare @DateRange nvarchar(100)
set @FromDate = @ChoosenFromDate
set @ToDate = @ChoosenToDate
create table #tempTable 
(InquiryStatus nvarchar(50), TotalAmount decimal(18,4),StatusCount int,
 SelecetdDate nvarchar(100),ProductTypeID int)
 
create table #AllDatesRange (DateRange nvarchar(100),FromDate datetime,ToDate datetime)
-- User Choose Month
if(@PeriodChoice = 0)
Begin
	if(@IsFromToChecked = 0)
    Begin	
		if(@Current = 'true')
		begin
			set @FromDate = DATEADD(month, -@PeriodNumber ,getdate())
			set @ToDate = getdate()
		end
		else
		begin
			set @FromDate = DATEADD(month, -@PeriodNumber +1,DATEADD(month,-1, getdate()))
			set @ToDate = DATEADD(month,-1, getdate())
		end
		
		SET @FromDate = DATEADD(DD, 1 - DAY(@FromDate), @FromDate)
		
		print(@FromDate)
		print(@ToDate)
		
		SELECT @ToDate = dateadd(mm,1,@ToDate - day(@ToDate)+1)-1
		SELECT @FromDate = (CAST(STR(MONTH(@FromDate))+'/'+STR(01)+'/'+STR(YEAR(@FromDate)) AS DateTime))
    END
	
	set @d= @FromDate 
	while @d < @ToDate 
	Begin 
		 insert into #AllDatesRange 
		        values (Convert(nvarchar(5),Month(@d),100) + '-' + Convert(nvarchar(5),Year(@d),100)
		        ,@d,DATEADD(month,1,@d))
		 set @d = DATEADD(month,1,@d)
	END
END
--User Choose Quarter
if(@PeriodChoice = 1)
Begin
	if(@IsFromToChecked = 0)
    Begin
		if(@Current = 'true')
		begin
			set @FromDate = DATEADD(month, -(@PeriodNumber *3) ,getdate())
			set @ToDate = getdate()
		end
		else
		begin
			set @FromDate = DATEADD(month, -(@PeriodNumber *3) +1,DATEADD(month,-4, getdate()))
			set @ToDate = DATEADD(month,-1, getdate())
		end
		
		set @FromDate = [dbo].[GetFirstDayOfQuarter](@FromDate)	
		
		print(@FromDate)
		print(@ToDate)
		
		SELECT @ToDate = dateadd(mm,1,@ToDate - day(@ToDate)+1)-1
		SELECT @FromDate = (CAST(STR(MONTH(@FromDate))+'/'+STR(01)+'/'+STR(YEAR(@FromDate)) AS DateTime))
    END
	set @d= @FromDate 
	while @d < @ToDate 
	Begin 
		 insert into #AllDatesRange 
		        values ('Q.' + Convert(nvarchar(5),datepart(qq,@d),100) + ' - ' + Convert(nvarchar(5),Year(@d),100)
		        ,@d,DATEADD(month,3,@d))
		 set @d = DATEADD(month,3,@d)
	END
END
-- User Choose Year
else if(@PeriodChoice = 2)
Begin
	if(@IsFromToChecked = 0)
    Begin	
		if(@Current = 'true')
		begin
			set @FromDate = DATEADD(year, -@PeriodNumber ,getdate())
			set @ToDate = getdate()
		end
		else
		begin
			set @FromDate = DATEADD(year, -@PeriodNumber +1,DATEADD(year,-1, getdate()))
			set @ToDate = DATEADD(year,-1, getdate())
		end
		--print(@FromDate + ',' + @ToDate + '')
		
		SELECT @ToDate = dateadd(mm,1,@ToDate - day(@ToDate)+1)-1
		SELECT @FromDate = (CAST(STR(MONTH(@FromDate))+'/'+STR(01)+'/'+STR(YEAR(@FromDate)) AS DateTime))
   END 
   set @d= @FromDate 
	while @d < @ToDate 
	Begin 
		 insert into #AllDatesRange 
		        values (Convert(nvarchar(5),Year(@d),100)
		        ,@d,DATEADD(year,1,@d))
		 set @d = DATEADD(year,1,@d)
	END
	
END
	 -- User choose week
else if(@PeriodChoice = 3)
Begin
	set @d= @FromDate 
    DECLARE @week int
	while @d < @ToDate 
	Begin 
	     SELECT @week = DATEPART(wk,@d)
		 insert into #AllDatesRange 
		        values ('WC.' + Convert(nvarchar(5), @week,100)
		              + '-' 		            
		              + Convert(nvarchar(5),Year(@d),100)
		              , @d
		              , DATEADD(day,7,@d)
		             )
		 set @d = DATEADD(day,7,@d)
	END      
       
END   
DECLARE db_cursor CURSOR FOR  
select FromDate,ToDate,DateRange from #AllDatesRange
OPEN db_cursor  
FETCH NEXT FROM db_cursor INTO @TempFromDate, @TempToDate,@DateRange
WHILE @@FETCH_STATUS = 0  
BEGIN   
if(@InquiryStatus = 'Order')
begin    
   insert into #tempTable	
         Select 'Order' InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,
         SUM(StatusCount) as StatusCount,
         @DateRange SelecetdDate,
         ISNull(ProductTypeID,0) ProductTypeID
              from ( SELECT Count('Order') as StatusCount,
						[dbo].[GetBacklogForSpecificPeriod]
						(ISNull(Sum(PriceInEuro),0),SupplierID,@TempToDate,ProductTypeID, BranchID) 
						as TotalAmount,
						 ISNull(ProductTypeID,0) ProductTypeID
				FROM  viewSubProjectTotals
				where  BranchID = @BranchID and OrderDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@TempToDate)))
				      and ((DeliveredON >= @TempToDate or DeliveredON is null)
				       OR ([Delivered] = 0 or [Delivered] is null))
					and SupplierID = @SupplierID 
			   Group by ProductTypeID,SupplierID, BranchID		   
			  ) as tbl    
		group by ProductTypeID     
         order by InquiryStatus    
         
         print (@TempFromDate)
         print (@TempToDate)
end
      FETCH NEXT FROM db_cursor INTO @TempFromDate, @TempToDate,@DateRange
END  
CLOSE db_cursor  
DEALLOCATE db_cursor 
	select ISNull(InquiryStatus,@InquiryStatus) InquiryStatus, IsNull(TotalAmount,0) TotalAmount,
	IsNull(StatusCount,0) StatusCount , #AllDatesRange.DateRange as SelecetdDate ,
	ISNull(ProductTypeID,0) ProductTypeID
	from 
	#tempTable Right Outer join #AllDatesRange
	on #AllDatesRange.DateRange = #tempTable.SelecetdDate
	 
   
	--DROP TABLE [dbo].[#tempTable]	
	--DROP TABLE [dbo].[#AllDatesRange]
	
    print(@FromDate)
	print(@ToDate)   
END
