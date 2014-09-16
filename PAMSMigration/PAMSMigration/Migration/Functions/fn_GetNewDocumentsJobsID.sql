--Functions
Create FUNCTION [Migration].[fn_GetNewDocumentsJobsID]
(
	@EgyptID int ,
	@RPEID int,
	@QatarID int
)
RETURNS int
AS
BEGIN
	declare @NewDocumentJobID int
	set @NewDocumentJobID=null
	if @EgyptID <>0
	begin
	select @NewDocumentJobID =  ID from DocumentsJobs
	where EgyptID=@EgyptID
	end
	else begin
	if @RPEID <>0
	begin
	select @NewDocumentJobID =  ID from DocumentsJobs
	where RPEID=@RPEID
	end
	
	else if @QatarID <>0
	begin
	select @NewDocumentJobID =  ID from DocumentsJobs
	where QatarID=@QatarID
	end
	end
	return @NewDocumentJobID
END
