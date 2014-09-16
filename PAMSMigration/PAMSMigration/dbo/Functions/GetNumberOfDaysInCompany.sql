/****** Object:  UserDefinedFunction [dbo].[GetNumberOfDaysInCompany]    Script Date: 03/20/2013 12:55:44 ******/
CREATE FUNCTION [dbo].[GetNumberOfDaysInCompany]
(
	@HireDate datetime,
	@LeaveDate datetime
)
RETURNS int
AS
BEGIN
	declare @Result int 
	
	if(@LeaveDate is null)
	   set @Result = DATEDIFF(day, @HireDate, getdate())
	else
	   set @Result = DATEDIFF(day, @HireDate, @LeaveDate)
	  
	return @Result
END
