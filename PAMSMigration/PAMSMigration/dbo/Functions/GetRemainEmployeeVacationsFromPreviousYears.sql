
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetRemainEmployeeVacationsFromPreviousYears]
(
	@EmployeeID int,
	@Year int
)
RETURNS int
AS
BEGIN
	
	declare @TotalDaysAnnual int
	declare @TotalDaysCasual int
	declare @RemainDays int
	declare @TotalNumOfDaysDueAnnual int
	declare @TotalNumOfDaysDueCasual int
	
	--select @TotalNumOfDays = NumOfVacation from [Person].[PersonExtra] where PersonID = @EmployeeID
	select @TotalNumOfDaysDueAnnual = SUM( NumOfVacationsAnnual)  from PersonYearlyVacations  where PersonID = @EmployeeID and YEAR < @Year
	select @TotalNumOfDaysDueCasual = SUM( NumOfVacationsCasual)  from PersonYearlyVacations  where PersonID = @EmployeeID and YEAR < @Year
      select @TotalDaysAnnual = Sum(NumOfDays) from [dbo].[EmployeeVacations] 
	
	where ( (Year(StartDate) between   @Year - 2 and @Year - 1  )  or ( Year(EndDate) between   @Year - 2 and @Year - 1  )) and PersonID = @EmployeeID
	    and ( VacationTypeID = 2 )
	    
	    	select @TotalDaysCasual = Sum(NumOfDays) from [dbo].[EmployeeVacations] 
	where ( (Year(StartDate) between   @Year - 2 and @Year - 1  )  or ( Year(EndDate) between   @Year - 2 and @Year - 1  )) and PersonID = @EmployeeID
	    and ( VacationTypeID in ( 1,9 ) )
	--set @RemainDays = case when @TotalDays is null then 0 else   (ISNull(@TotalNumOfDays,0))  - ISNull(@TotalDays,0)end 
	
	set @RemainDays = case when  case when  (@TotalNumOfDaysDueCasual - @TotalDaysCasual) > 0 then 0 else (@TotalNumOfDaysDueCasual - @TotalDaysCasual) end   + (@TotalNumOfDaysDueAnnual    - @TotalDaysAnnual ) < 0 then 0 
	else case when  (@TotalNumOfDaysDueCasual - @TotalDaysCasual) > 0 then 0 else (@TotalNumOfDaysDueCasual - @TotalDaysCasual) end   + (@TotalNumOfDaysDueAnnual    - @TotalDaysAnnual ) end
	
	
	return @RemainDays
END
