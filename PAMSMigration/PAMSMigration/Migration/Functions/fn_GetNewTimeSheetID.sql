--End TimeSheet
--------------------------------------------------------------------------------
--Functions
CREATE FUNCTION [Migration].[fn_GetNewTimeSheetID]
(
	@EgyptID int ,
	@RPEID int,
	@QatarID int
)
RETURNS int
AS
BEGIN
	declare @NewSheetID int
	set @NewSheetID=null
	if @EgyptID <>0
	begin
	select @NewSheetID =  ID from TimeSheet
	where EgyptID=@EgyptID
	end
	else begin
	if @RPEID <>0
	begin
	select @NewSheetID =  ID from TimeSheet
	where RPEID=@RPEID
	end
	
	else if @QatarID <>0
	begin
	select @NewSheetID =  ID from TimeSheet
	where QatarID=@QatarID
	end
	end
	return @NewSheetID
END
