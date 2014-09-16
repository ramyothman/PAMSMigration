CREATE procedure [dbo].[GetExpIncome]( 
@year int = 2013, 
@month int = 11, 
@isfixed  bit = null , 
@isin bit = null,
@DaysNos int 
 )
as
declare @startdate datetime
declare @enddate datetime
declare @value decimal(18,2)
declare @daysNo int
declare @date datetime 
declare @Expensedate datetime
declare @Name nvarchar(Max)
declare @tempTable2 table
(
  AmountInEuro decimal(18,2),  year int, month int
)
declare @tempTableOut table
(
  AmountInEuro decimal(18,2), year int, month int
)
declare  @tempTable  table 
    (
        month int,
        year int,
        AmountInEuro decimal(18,2),
        Expensedate datetime , 
        Name nvarchar(50)
        
    ) 
DECLARE expenseCur CURSOR 
FOR  
SELECT       
           Expenses.StartDate, Expenses.EndDate, Expenses.Value,PeriodType.DaysNo, Expenses.Name
FROM         Expenses INNER JOIN
                      PeriodType ON Expenses.PeriodTypeID = PeriodType.PeriodTypeID INNER JOIN
                      ExpenseType ON Expenses.ExpenseTypeID = ExpenseType.ExpenseTypeID
WHERE     (@isin is null or  ExpenseType.IsIn = @isin) and (Isfixed = @isfixed or @isfixed is null  )
OPEN expenseCur
FETCH NEXT FROM expenseCur into @startdate , @enddate,@value,@daysNo,@Name
WHILE @@FETCH_STATUS = 0
BEGIN
set @date= @startdate
  while (@date >= @startdate and  @date<= @enddate )
  begin
    insert into @tempTable values (month(@date) , YEAR(@date)  , @value ,@date ,@Name  )
    
    set @date=  DateAdd(month,@daysNo/30,@date  )
    
   
  end
FETCH NEXT FROM expenseCur into @startdate , @enddate,@value,@daysNo ,@Name
 END
 CLOSE expenseCur
 DEALLOCATE expenseCur
  
insert into @tempTable2 exec GetExpectedCommTradingIncome  @DaysNos, @year,@month
--select * from (  
 insert into @tempTableOut  select  sum(AmountInEuro)as AmountInEuro , year , month  from @tempTable 
where ( year  = @year  and ( @month = 0 or month >= @month ))
       or (year  > @year   )
group by year , month,Expensedate ,Name 
union 
select  AmountInEuro ,  year , month from @tempTable2 
select SUM(AmountInEuro) as AmountInEuro , year,month  , CAST( month as nvarchar(2)) + '-' +  CAST( year as nvarchar(4)) as month_year from @tempTableOut
group by  year,month
order by  year , month 
--select  AmountInEuro , year,month
--from GetAllExpectedIncome 
--where ( year  = @year  and ( @month = 0 or month >= @month ))
--       or (year  > @year   )
       
--       order by year,month
--)
