CREATE FUNCTION [Migration].[fn_GetNewCommentID]
(
	@EgyptID int ,
	@RPEID int,
	@QatarID int
)
RETURNS int
AS
BEGIN
	declare @NewCmntID int
	set @NewCmntID=null
	if @EgyptID <>0
	begin
	select @NewCmntID =  ProjectCommentID from ProjectsComments
	where EgyptID=@EgyptID
	end
	else begin
	if @RPEID <>0
	begin
	select @NewCmntID =  ProjectCommentID from ProjectsComments
	where RPEID=@RPEID
	end
	
	else if @QatarID <>0
	begin
	select @NewCmntID =  ProjectCommentID from ProjectsComments
	where QatarID=@QatarID
	end
	end
	return @NewCmntID
END
