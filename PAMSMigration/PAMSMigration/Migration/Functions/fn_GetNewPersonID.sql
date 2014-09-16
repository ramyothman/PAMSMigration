--End Products
--------------------------------------------------------------------------------
--Functions
CREATE FUNCTION [Migration].[fn_GetNewPersonID]
(
	@EgyptID int ,
	@RPEID int,
	@QatarID int
)
RETURNS int
AS
BEGIN
	declare @NewPersonID int
	set @NewPersonID=0
	if @EgyptID <>0
	begin
	select @NewPersonID =  BusinessEntityID from Person.BusinessEntity 
	where EgyptBusinessEntityID=@EgyptID
	end
	else begin
	if @RPEID <>0
	begin
	select @NewPersonID =  BusinessEntityID from Person.BusinessEntity 
	where RPEBusinessEntityID=@RPEID
	end
	
	else if @QatarID <>0
	begin
	select @NewPersonID =  BusinessEntityID from Person.BusinessEntity 
	where QatarBusinessEntityID=@QatarID
	end
	end
	return @NewPersonID
END
