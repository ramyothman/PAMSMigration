--End ProjectsHistory
--------------------------------------------------------------------------------
--Functions
CREATE FUNCTION [Migration].[fn_GetNewProjectHistoryID]
(
	@EgyptID int ,
	@RPEID int,
	@QatarID int
)
RETURNS int
AS
BEGIN
	declare @NewProjectHistoryID int
	set @NewProjectHistoryID=0
	if @EgyptID <>0
	begin
	select @NewProjectHistoryID =  ID from ProjectsHistory
	where EgyptID=@EgyptID
	end
	else begin
	if @RPEID <>0
	begin
	select @NewProjectHistoryID =  ID from ProjectsHistory
	where RPEID=@RPEID
	end
	
	else if @QatarID <>0
	begin
	select @NewProjectHistoryID =  ID from ProjectsHistory
	where QatarID=@QatarID
	end
	end
	return @NewProjectHistoryID
END
