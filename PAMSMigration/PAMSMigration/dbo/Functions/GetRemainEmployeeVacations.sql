
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetRemainEmployeeVacations]
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
	select @TotalNumOfDaysDueAnnual = SUM( NumOfVacationsAnnual)  from PersonYearlyVacations  where PersonID = @EmployeeID and YEAR = @Year
	select @TotalNumOfDaysDueCasual = SUM( NumOfVacationsCasual)  from PersonYearlyVacations  where PersonID = @EmployeeID and YEAR = @Year
 select @TotalDaysAnnual = isnull(Sum(NumOfDays),0)  from [dbo].[EmployeeVacations] 
	
	where ( (Year(StartDate) =   @Year  )  or ( Year(EndDate) =   @Year  )) and PersonID = @EmployeeID
	    and ( VacationTypeID = 2 )
	    
	    	select @TotalDaysCasual = isnull(Sum(NumOfDays),0)  from [dbo].[EmployeeVacations] 
	where ( (Year(StartDate) =   @Year   )  or ( Year(EndDate) =   @Year  )) and PersonID = @EmployeeID
	    and ( VacationTypeID = 1 )
	--select @TotalDays = Sum(NumOfDays) from [dbo].[EmployeeVacations] 
	--where (Year(StartDate) = @Year or Year(EndDate) = @Year) and PersonID = @EmployeeID
	--    and (VacationTypeID = 1 or VacationTypeID = 2 )
	    
--	set @RemainDays = ISNull(@TotalNumOfDays,0) - ISNull(@TotalDays,0)
	set @RemainDays = ISNull( (@TotalNumOfDaysDueCasual - @TotalDaysCasual) + (@TotalNumOfDaysDueAnnual    - @TotalDaysAnnual ),0)
	return @RemainDays
END
