CREATE FUNCTION [Migration].[fn_GetNewCategoryID]
(
	@EgyptID int ,
	@RPEID int,
	@QatarID int
)
RETURNS int
AS
BEGIN
	declare @NewCatID int
	set @NewCatID=null
	if @EgyptID <>0
	begin
	select @NewCatID =  CategoryID from Category
	where EgyptID=@EgyptID
	end
	else begin
	if @RPEID <>0
	begin
	select @NewCatID =  CategoryID from Category
	where RPEID=@RPEID
	end
	
	else if @QatarID <>0
	begin
	select @NewCatID =  CategoryID from Category
	where QatarID=@QatarID
	end
	end
	return @NewCatID
END
