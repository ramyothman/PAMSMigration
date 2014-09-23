/****** Object:  UserDefinedFunction [Migration].[[fn_GetNewLostReasonID]]    Script Date: 9/23/2014 6:50:24 PM ******/

Create FUNCTION [Migration].[fn_GetNewLostReasonID]
(
	@EgyptID int ,
	@RPEID int,
	@QatarID int
)
RETURNS int
AS
BEGIN
	declare @NewLostReasonID int
	set @NewLostReasonID=null
	if @EgyptID <>0
	begin
	select @NewLostReasonID =  ID from dbo.LostReasons
	where EgyptID=@EgyptID
	end
	else begin
	if @RPEID <>0
	begin
	select @NewLostReasonID =  ID from dbo.LostReasons
	where RPEID=@RPEID
	end
	
	else if @QatarID <>0
	begin
	select @NewLostReasonID =  ID from dbo.LostReasons
	where QatarID=@QatarID
	end
	end
	return @NewLostReasonID
END