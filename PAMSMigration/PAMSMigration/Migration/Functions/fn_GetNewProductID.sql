CREATE FUNCTION [Migration].[fn_GetNewProductID]
(
	@EgyptID int ,
	@RPEID int,
	@QatarID int
)
RETURNS int
AS
BEGIN
	declare @NewProductID int
	set @NewProductID=0
	if @EgyptID <>0
	begin
	select @NewProductID =  ProductID from dbo.Products
	where EgyptID=@EgyptID
	end
	else begin
	if @RPEID <>0
	begin
	select @NewProductID =  ProductID from dbo.Products
	where RPEID=@RPEID
	end
	
	else if @QatarID <>0
	begin
	select @NewProductID =  ProductID from dbo.Products
	where QatarID=@QatarID
	end
	end
	return @NewProductID
END
