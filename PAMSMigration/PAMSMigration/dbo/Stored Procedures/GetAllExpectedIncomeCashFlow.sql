create procedure [dbo].[GetAllExpectedIncomeCashFlow]
(@year int = 2013, 
@month int = 11, 
@isfixed  bit = null , 
@isin bit = null )
as
declare @Temp table
(  
        AmountInEuro decimal(18,2),
        year1 int , 
        month1 int 
        )
        
insert into @Temp  EXEC  	  GetExpIncome  2013, 11,null,null
select  SUM(AmountInEuro) ,CAST( month1 as nvarchar(2) ) + '-' +  cast(year1 as nvarchar(4)) as year_month
from @Temp 
group by year1,month1
order by year1,month1
