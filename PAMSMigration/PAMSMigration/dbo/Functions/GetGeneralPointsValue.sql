/****** Object:  UserDefinedFunction [dbo].[GetGeneralPointsValue]    Script Date: 03/20/2013 12:55:44 ******/
CREATE FUNCTION [dbo].[GetGeneralPointsValue] 
(
	-- Add the parameters for the function here
)
RETURNS decimal(26,10)
AS
BEGIN
	-- Declare the return variable here
	return 20 * 100000
END
