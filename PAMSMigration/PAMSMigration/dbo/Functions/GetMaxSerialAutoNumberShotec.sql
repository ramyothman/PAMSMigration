/****** Object:  UserDefinedFunction [dbo].[CheckIsUserLogin]    Script Date: 03/20/2013 12:55:44 ******/
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetMaxSerialAutoNumberShotec]
(	
 @Shotec nvarchar
)
RETURNS nvarchar(50) 
AS
BEGIN
declare @result nvarchar(50)=''
SELECT   	 	@result = CAST( ISNULL(  max ( cast( substring( ShotecNo ,len(@Shotec ) , case when ( len(ShotecNo)- len(@Shotec) ) < 0 then 0 else  len(ShotecNo)- len(@Shotec) end ) as int ) )  ,0) + 1  as nvarchar(50) )
FROM         Inquiries
WHERE     (ShotecNo LIKE  @Shotec +'%' )
return @result 
END
