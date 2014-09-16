--End Transactions
--------------------------------------------------------------------------------
--Functions
CREATE FUNCTION [Migration].[fn_GetNewTransactionID]
(
	@EgyptID nvarchar(50) ,
	@RPEID nvarchar(50),
	@QatarID nvarchar(50)
)
RETURNS nvarchar(50)
AS
BEGIN
	declare @NewTransactionID nvarchar(50)
	set @NewTransactionID='0'
	if @EgyptID <>'0'
	begin
	select @NewTransactionID =  TransactionID from Transactions
	where EgyptID=@EgyptID
	end
	else begin
	if @RPEID <>'0'
	begin
	select @NewTransactionID =  TransactionID from Transactions
	where RPEID=@RPEID
	end
	
	else if @QatarID <>'0'
	begin
	select @NewTransactionID =  TransactionID from Transactions
	where QatarID=@QatarID
	end
	end
	return @NewTransactionID
END
