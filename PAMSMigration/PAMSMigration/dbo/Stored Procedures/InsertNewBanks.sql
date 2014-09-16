CREATE PROCEDURE [dbo].[InsertNewBanks]
    @BankCode nvarchar(50),
    @BankName nvarchar(50),
    @BankAccountNumber nvarchar(50),
    @BranchID int,
     @SwiftCode nvarchar(50),
    @CurrencyID int
    
AS
INSERT INTO [dbo].[Banks] (
    [BankCode],
    [BankName],
    [CurrencyID],
     [SwiftCode]
     )
Values (
    @BankCode,
    @BankName,
    @CurrencyID,
    @SwiftCode
    )
IF @@ROWCOUNT > 0
insert into BankBranches(BankID,BranchID,BankAccountNumber)
values (@@IDENTITY,@BranchID,@BankAccountNumber)
Select * from Banks
Where [ID] = @@identity
