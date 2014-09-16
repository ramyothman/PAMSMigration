--End System Pages
--------------------------------------------------------------------------------
--Functions
CREATE FUNCTION [Migration].[fn_GetNewPageID]
(
	@EgyptID int ,
	@RPEID int,
	@QatarID int
)
RETURNS int
AS
BEGIN
	declare @NewPageID int
	set @NewPageID=null
	if @EgyptID <>0
	begin
	select @NewPageID =  ID from dbo.SystemPages
	where EgyptID=@EgyptID
	end
	else begin
	if @RPEID <>0
	begin
	select @NewPageID =  ID from dbo.SystemPages
	where RPEID=@RPEID
	end
	
	else if @QatarID <>0
	begin
	select @NewPageID =  ID from dbo.SystemPages
	where QatarID=@QatarID
	end
	end
	return @NewPageID
END
