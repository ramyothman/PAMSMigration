-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetClientAnalysisAllStatusesGraphsHitRate]
	-- Add the parameters for the stored procedure here
@InquiryStatus nvarchar(max),
@ID int,
@SelectedIDs nvarchar(Max),
@ReportType int,
@ChoosenProductTypes nvarchar(255),
@BranchID int
AS
BEGIN
create table #tempTable 
(InquiryStatus nvarchar(50), TotalAmount decimal(18,4), Name nvarchar(100),
StatusCount int)
create table #selectedNames (Name nvarchar(100)) 
 
-- Principle Client Analysis
if @ReportType = 0
insert into  #tempTable execute [dbo].[GetPrincipleClientAnalysisAllStatusesGraphHitRate] @InquiryStatus,
                                 @ID,@SelectedIDs,@ChoosenProductTypes,@BranchID
-- Client Supplier Analysis                                 
else if @ReportType = 1
insert into  #tempTable  execute [dbo].[GetClientSupplierAnalysisAllStatueseGraphHitRate] @InquiryStatus,
                                 @ID,@SelectedIDs,@ChoosenProductTypes,@BranchID
insert into #selectedNames
select distinct Name 
from #tempTable
declare @index int 
declare @sql nvarchar(MAX)
set @sql = ''
select @index = charindex('Inquiry',@InquiryStatus)
begin
if(@index > 0)    
	set @sql = '(select ''Inquiry'' as InquiryStatus,ISNULL(t.TotalAmount,0)TotalAmount , 
	#selectedNames.Name as CompanyName,	ISNull(t.StatusCount,0) StatusCount 
	from ( select * from #tempTable where #tempTable.InquiryStatus = ''Inquiry'') as t right outer join #selectedNames on #selectedNames.Name  = t.Name)'
end
select @index = charindex('Offer',@InquiryStatus)
if(@index > 0) 
begin
 if(len(@sql) > 0)
    set @sql = @sql + ' union '
 set @sql = @sql + '(select ''Offer'' as InquiryStatus,ISNULL(t.TotalAmount,0)TotalAmount , 
	#selectedNames.Name as CompanyName,	ISNull(t.StatusCount,0) StatusCount 
	from ( select * from #tempTable where #tempTable.InquiryStatus = ''Offer'') as t right outer join #selectedNames on #selectedNames.Name = t.Name)'
end
select @index = charindex('Order',@InquiryStatus)
if(@index > 0) 
begin
if(len(@sql) > 0)
    set @sql = @sql + ' union '
   set @sql = @sql + '(select ''Order'' as InquiryStatus,ISNULL(t.TotalAmount,0)TotalAmount , 
	#selectedNames.Name as CompanyName,	ISNull(t.StatusCount,0) StatusCount 
	from ( select * from #tempTable where #tempTable.InquiryStatus = ''Order'') as t right outer join #selectedNames on #selectedNames.Name = t.Name)'
end
select @index = charindex('Delivered',@InquiryStatus)
if(@index > 0) 
begin
if(len(@sql) > 0)
    set @sql = @sql + ' union '
   set @sql = @sql +'(select ''Delivered'' as InquiryStatus,ISNULL(t.TotalAmount,0)TotalAmount , 
	#selectedNames.Name as CompanyName,	ISNull(t.StatusCount,0) StatusCount 
	from ( select * from #tempTable where #tempTable.InquiryStatus = ''Delivered'') as t right outer join #selectedNames on #selectedNames.Name = t.Name)'
end	
select @index = charindex('Lost',@InquiryStatus)
if(@index > 0)
begin 
if(len(@sql) > 0)
    set @sql = @sql + ' union '
   set @sql = @sql + '(select ''Lost'' as InquiryStatus,ISNULL(t.TotalAmount,0)TotalAmount , 
	#selectedNames.Name as CompanyName,	ISNull(t.StatusCount,0) StatusCount 
	from ( select * from #tempTable where #tempTable.InquiryStatus = ''Lost'') as t right outer join #selectedNames on #selectedNames.Name  = t.Name)'
end
select @index = charindex('LateResponse',@InquiryStatus)
if(@index >0) 
begin
if(len(@sql) > 0)
    set @sql = @sql + ' union '
   set @sql = @sql + '(select ''LateResponse'' as InquiryStatus,ISNULL(t.TotalAmount,0)TotalAmount , 
	#selectedNames.Name as CompanyName,	ISNull(t.StatusCount,0) StatusCount 
	from ( select * from #tempTable where #tempTable.InquiryStatus = ''LateResponse'') as t right outer join #selectedNames on #selectedNames.Name = t.Name)'
end	
select @index = charindex('Cancelled',@InquiryStatus)
if(@index > 0) 
begin
if(len(@sql) > 0)
    set @sql = @sql + ' union '
   set @sql = @sql + '(select ''Cancelled'' as InquiryStatus,ISNULL(t.TotalAmount,0)TotalAmount , 
	#selectedNames.Name as CompanyName,	ISNull(t.StatusCount,0) StatusCount 
	from ( select * from #tempTable where #tempTable.InquiryStatus = ''Cancelled'') as t right outer join #selectedNames on #selectedNames.Name = t.Name)'
end
select @index = charindex('Regret',@InquiryStatus)
if(@index > 0) 
begin
if(len(@sql) > 0)
    set @sql = @sql + ' union '
   set @sql = @sql + '(select ''Regret'' as InquiryStatus,ISNULL(t.TotalAmount,0)TotalAmount , 
	#selectedNames.Name as CompanyName,	ISNull(t.StatusCount,0) StatusCount 
	from ( select * from #tempTable where #tempTable.InquiryStatus = ''Regret'') as t right outer join #selectedNames on #selectedNames.Name = t.Name)'
end
print(@sql) 
EXECUTE( @sql)
--DROP TABLE [dbo].[#tempTable]	
--Drop table [dbo].[#selectedNames]
END
