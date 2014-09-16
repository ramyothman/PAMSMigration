--End DocumentsJobs
--------------------------------------------------------------------------------
--Functions
CREATE FUNCTION [Migration].[fn_GetNewCustomerID]
(
	@EgyptID int ,
	@RPEID int,
	@QatarID int
)
RETURNS int
AS
BEGIN
	declare @NewDocID int
	set @NewDocID=0
	if @EgyptID <>0
	begin
	select @NewDocID =  CustomerID from Customers
	where EgyptID=@EgyptID
	end
	else begin
	if @RPEID <>0
	begin
	select @NewDocID =  CustomerID from Customers
	where RPEID=@RPEID
	end
	
	else if @QatarID <>0
	begin
	select @NewDocID =  CustomerID from Customers
	where QatarID=@QatarID
	end
	end
	return @NewDocID
END
