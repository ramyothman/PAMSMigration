/****** Object:  UserDefinedFunction [dbo].[FunSplitShotecNumber]    Script Date: 03/20/2013 12:55:44 ******/
CREATE FUNCTION [dbo].[FunSplitShotecNumber]
(
@Str nvarchar(100)
)
RETURNS nvarchar(50)
AS
BEGIN
declare @Pos as int 
declare @NewStr nvarchar(50)
SET @NewStr = @Str
SET @Pos = charindex('/',@Str)
if(@Pos > 0)   
 select @NewStr = SUBSTRING(@Str,0, @Pos)
 
 
return @NewStr
END
