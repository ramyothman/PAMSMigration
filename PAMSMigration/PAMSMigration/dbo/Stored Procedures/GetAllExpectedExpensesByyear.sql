CREATE procedure [dbo].[GetAllExpectedExpensesByyear](@year int , @month int = 0, @isfixed  bit = null , @isin bit = null)
as
declare @startdate datetime
declare @enddate datetime
declare @value decimal(18,2)
declare @daysNo int
declare @date datetime 
declare @Expensedate datetime
declare @Name nvarchar(Max)
declare @tempTable table 
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
WHERE     (@isin is null or  ExpenseType.IsIn = @isin)and (Isfixed = @isfixed or @isfixed = null  )
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
select  SUM(AmountInEuro)as AmountInEuro , year , month , Expensedate , Name from @tempTable 
where ( year  = @year  and ( @month = 0 or month >= @month ))
       or (year  = @year + 1  )
group by year , month,Expensedate ,Name 
order by year,month
