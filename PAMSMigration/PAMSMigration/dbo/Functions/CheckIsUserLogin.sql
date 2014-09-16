/****** Object:  UserDefinedFunction [dbo].[CheckIsUserLogin]    Script Date: 03/20/2013 12:55:44 ******/
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[CheckIsUserLogin]
(	
 @UserID int, 
 @IPAddress nvarchar(50),
 @MaxNumOfMins int
)
RETURNS bit 
AS
BEGIN
declare @result bit
declare @res int
select @res = count(ID) 
from ConcurrentUsers
where LogOutDate is null and SuspensionDate is null and ModifiedDate is null
 and UserID = @UserID and IPAddress = @IPAddress and 
 [dbo].[GetConcurrentUsersDateDifferenceByMin] (PulseDate)< @MaxNumOfMins
if(@res = 0)
set @result = 'False'
else
set @result = 'True'
return @result 
END
