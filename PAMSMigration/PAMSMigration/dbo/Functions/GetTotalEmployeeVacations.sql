
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetTotalEmployeeVacations]
(
	@EmployeeID int,
	@Year int
)
RETURNS int
AS
BEGIN
	
	declare @TotalDays int
	
	select @TotalDays = Sum(NumOfDays) from [dbo].[EmployeeVacations] 
	where (Year(StartDate) = @Year or Year(EndDate) = @Year) and PersonID = @EmployeeID
	     and (VacationTypeID = 1 or VacationTypeID = 2 or VacationTypeID = 9 )
	
	return ISNull(@TotalDays,0)

END
