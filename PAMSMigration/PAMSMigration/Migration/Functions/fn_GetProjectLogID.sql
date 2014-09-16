CREATE FUNCTION [Migration].[fn_GetProjectLogID]
(
	@EgyptID int ,
	@RPEID int,
	@QatarID int
)
RETURNS int
AS
BEGIN
	declare @NewLogID int
	set @NewLogID=null
	if @EgyptID <>0
	begin
	select @NewLogID =  ID from dbo.ProjectsLog
	where EgyptID=@EgyptID
	end
	else begin
	if @RPEID <>0
	begin
	select @NewLogID =  ID from dbo.ProjectsLog
	where RPEID=@RPEID
	end
	
	else if @QatarID <>0
	begin
	select @NewLogID =  ID from dbo.ProjectsLog
	where QatarID=@QatarID
	end
	end
	return @NewLogID
END
