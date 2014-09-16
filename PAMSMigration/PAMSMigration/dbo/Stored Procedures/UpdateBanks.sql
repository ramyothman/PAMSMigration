CREATE PROCEDURE [dbo].[UpdateBanks]
    @BankCode nvarchar(50),
    @OldID int,
    @BankName nvarchar(50),
    @BankAccountNumber nvarchar(50),
    @BranchID int,
    @SwiftCode nvarchar(50),
    @CurrencyID int
AS
UPDATE [dbo].[Banks]
SET
    BankCode = @BankCode,
    BankName = @BankName,
    CurrencyID =@CurrencyID ,
    SwiftCode = @SwiftCode 
    
    --BankAccountNumber = @BankAccountNumber,
    --BranchID = @BranchID
WHERE [ID] = @OldID
IF @@ROWCOUNT > 0
update BankBranches set BranchID=@BranchID , BankAccountNumber=@BankAccountNumber
where BankID = @OldID
Select * From Banks 
Where [ID] = @OldID
