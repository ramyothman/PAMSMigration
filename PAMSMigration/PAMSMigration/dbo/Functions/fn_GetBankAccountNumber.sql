CREATE FUNCTION [dbo].[fn_GetBankAccountNumber]
(	@BankID int)
RETURNS nvarchar(50) 
AS
BEGIN
	declare @AccNum nvarchar(50)  
	select top 1 @AccNum =  BankAccountNumber from BankBranches where BankID=@BankID
return @AccNum
END