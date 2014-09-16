--End Visits
--------------------------------------------------------------------------------
--Functions
CREATE FUNCTION [Migration].[fn_GetNewVisitID]
(
	@EgyptID int ,
	@RPEID int,
	@QatarID int
)
RETURNS int
AS
BEGIN
	declare @NewVisitID int
	set @NewVisitID=0
	if @EgyptID <>0
	begin
	select @NewVisitID =  VisitID from dbo.Visits
	where EgyptID=@EgyptID
	end
	else begin
	if @RPEID <>0
	begin
	select @NewVisitID =  VisitID from dbo.Visits
	where RPEID=@RPEID
	end
	
	else if @QatarID <>0
	begin
	select @NewVisitID =  VisitID from dbo.Visits
	where QatarID=@QatarID
	end
	end
	return @NewVisitID
END
