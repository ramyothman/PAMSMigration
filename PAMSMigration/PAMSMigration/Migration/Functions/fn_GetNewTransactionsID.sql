--Functions
CREATE FUNCTION [Migration].[fn_GetNewTransactionsID]
(
	@EgyptID nvarchar(50) ,
	@RPEID nvarchar(50),
	@QatarID nvarchar(50)
)
RETURNS nvarchar(50)
AS
BEGIN
	declare @NewTransactionID nvarchar(50)
	set @NewTransactionID=null
	if @EgyptID <>''
	begin
	select @NewTransactionID =  TransactionID from Transactions
	where EgyptID=@EgyptID
	end
	else begin
	if @RPEID <>''
	begin
	select @NewTransactionID =  TransactionID from Transactions
	where RPEID=@RPEID
	end
	
	else if @QatarID <>''
	begin
	select @NewTransactionID =  TransactionID from Transactions
	where QatarID=@QatarID
	end
	end
	return @NewTransactionID
END
