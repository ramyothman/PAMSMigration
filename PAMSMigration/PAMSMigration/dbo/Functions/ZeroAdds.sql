/****** Object:  UserDefinedFunction [dbo].[CheckIsUserLogin]    Script Date: 03/20/2013 12:55:44 ******/
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[ZeroAdds]
(	
 @CharsNo int
)
RETURNS nvarchar(50) 
AS
BEGIN
declare @result nvarchar(50)=''
while(@CharsNo > 0)
begin
set @result= @result + '0'
set @CharsNo = @CharsNo - 1 
end
return @result 
END
