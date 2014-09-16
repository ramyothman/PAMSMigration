/****** Object:  UserDefinedFunction [dbo].[GetNumberOfConcurrentUsers]    Script Date: 03/20/2013 12:55:44 ******/
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetNumberOfConcurrentUsers]
(	
)
RETURNS int 
AS
BEGIN
declare @result int
select @result = count(ID) 
from ConcurrentUsers
 where LogOutDate is null and SuspensionDate is null and ModifiedDate is null
return @result 
END
