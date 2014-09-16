/****** Object:  UserDefinedFunction [dbo].[GetConcurrentUsersDateDifferenceByMin]    Script Date: 03/20/2013 12:55:44 ******/
CREATE FUNCTION [dbo].[GetConcurrentUsersDateDifferenceByMin] 
(
	@PulseDate datetime
)
RETURNS int 
AS
BEGIN
declare @result int
	SELECT @result = DATEDIFF(minute,@PulseDate, getdate());
return @result
END
