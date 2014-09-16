CREATE FUNCTION [Migration].[fn_GetNewSupplierID]
(
	@EgyptID int ,
	@RPEID int,
	@QatarID int
)
RETURNS int
AS
BEGIN
	declare @NewSupplierID int
	set @NewSupplierID=null
	if @EgyptID <>0
	begin
	select @NewSupplierID =  SupplierID from dbo.Suppliers
	where EgyptID=@EgyptID
	end
	else begin
	if @RPEID <>0
	begin
	select @NewSupplierID =  SupplierID from dbo.Suppliers
	where RPEID=@RPEID
	end
	
	else if @QatarID <>0
	begin
	select @NewSupplierID =  SupplierID from dbo.Suppliers
	where QatarID=@QatarID
	end
	end
	return @NewSupplierID
END
