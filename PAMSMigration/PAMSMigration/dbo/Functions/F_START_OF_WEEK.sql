/****** Object:  UserDefinedFunction [dbo].[F_START_OF_WEEK]    Script Date: 03/20/2013 12:55:44 ******/
CREATE function [dbo].[F_START_OF_WEEK]
(
	@DATE			datetime,
	-- Sun = 1, Mon = 2, Tue = 3, Wed = 4
	-- Thu = 5, Fri = 6, Sat = 7
	-- Default to Sunday
	@WEEK_START_DAY		int	= 1	
)
/*
Find the fisrt date on or before @DATE that matches 
day of week of @WEEK_START_DAY.
*/
returns		datetime
as
begin
declare	 @START_OF_WEEK_DATE	datetime
declare	 @FIRST_BOW		datetime
-- Check for valid day of week
if @WEEK_START_DAY between 1 and 7
	begin
	-- Find first day on or after 1753/1/1 (-53690)
	-- matching day of week of @WEEK_START_DAY
	-- 1753/1/1 is earliest possible SQL Server date.
	select @FIRST_BOW = convert(datetime,-53690+((@WEEK_START_DAY+5)%7))
	-- Verify beginning of week not before 1753/1/1
	if @DATE >= @FIRST_BOW
		begin
		select @START_OF_WEEK_DATE = 
		dateadd(dd,(datediff(dd,@FIRST_BOW,@DATE)/7)*7,@FIRST_BOW)
		end
	end
return @START_OF_WEEK_DATE
end
-- Sample function calls
--select dbo.F_START_OF_WEEK(getdate(),default) -- Returns Date for Sunday
--select dbo.F_START_OF_WEEK(getdate(),1)	-- Returns Date for Sunday
--select dbo.F_START_OF_WEEK(getdate(),2)	-- Returns Date for Monday
--select dbo.F_START_OF_WEEK(getdate(),3)	-- Returns Date for Tuesday
--select dbo.F_START_OF_WEEK(getdate(),4)	-- Returns Date for Wednesday
--select dbo.F_START_OF_WEEK(getdate(),5)	-- Returns Date for Thursday
--select dbo.F_START_OF_WEEK(getdate(),6)	-- Returns Date for Friday
--select dbo.F_START_OF_WEEK(getdate(),7)	-- Returns Date for Saturday
--select dbo.F_START_OF_WEEK(getdate(),0)	-- Returns NULL
--select dbo.F_START_OF_WEEK(getdate(),8)	-- Returns NULL
