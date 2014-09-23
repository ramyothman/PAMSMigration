--End Losts
--------------------------------------------------------------------------------
--Functions
Create FUNCTION [Migration].[fn_GetNewLostID]
(
	@EgyptID int ,
	@RPEID int,
	@QatarID int
)
RETURNS int
AS
BEGIN
	declare @NewLostID int
	set @NewLostID=0
	if @EgyptID <>0
	begin
	select @NewLostID =  LostID from Losts
	where EgyptID=@EgyptID
	end
	else begin
	if @RPEID <>0
	begin
	select @NewLostID =  LostID from Losts
	where RPEID=@RPEID
	end
	
	else if @QatarID <>0
	begin
	select @NewLostID =  LostID from Losts
	where QatarID=@QatarID
	end
	end
	return @NewLostID
END