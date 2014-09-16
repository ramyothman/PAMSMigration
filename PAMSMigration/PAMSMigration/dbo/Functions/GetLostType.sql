/****** Object:  UserDefinedFunction [dbo].[GetLostType]    Script Date: 03/20/2013 12:55:44 ******/
CREATE FUNCTION [dbo].[GetLostType] 
(
   @projectTypeID nvarchar(50)
	-- Add the parameters for the function here
)
RETURNS nvarchar(50)
AS
BEGIN
	
	declare @res nvarchar(50)	
	
	if (@ProjectTypeID = 'Lost')
	  set @res = 'Lost'
	else if (@ProjectTypeID = 'Cancelled')
	  set @res = 'Cancelled'
	else if (@ProjectTypeID = 'Regret')
	  set @res = 'Regret'
	else if (@ProjectTypeID = 'LateResponse')
	  set @res = 'Late Response'
	
	return @res
END
