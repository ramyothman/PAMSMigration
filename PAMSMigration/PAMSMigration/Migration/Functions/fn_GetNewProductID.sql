CREATE FUNCTION [Migration].[fn_GetNewProductID]
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
	where EgyptProductID=@EgyptID
	end
	else begin
	if @RPEID <>0
	begin
	select @NewCatID =  CategoryID from Category
	where RPEProductID=@RPEID
	end
	
	else if @QatarID <>0
	begin
	select @NewCatID =  CategoryID from Category
	where QatarProductID=@QatarID
	end
	end
	return @NewCatID
END
