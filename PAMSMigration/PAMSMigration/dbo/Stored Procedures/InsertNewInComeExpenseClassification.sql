CREATE PROCEDURE [dbo].[InsertNewInComeExpenseClassification]
    @CurrencyID int,
    @HasOpenBalance bit,
    @InComeExpenseClassificationID2 int,
    @IsDebit bit,
    @Name nvarchar(max),
    @IsClient bit , 
    @IsSupplier bit , 
    @IsJob bit
AS
INSERT INTO [dbo].[InComeExpenseClassification] (
    [CurrencyID],
    [HasOpenBalance],
    [InComeExpenseClassificationID2],
    [IsDebit],
    [Name],[IsClient], [IsSupplier], [IsJob]
)
Values (
    @CurrencyID,
    @HasOpenBalance,
    @InComeExpenseClassificationID2,
    @IsDebit,
    @Name,
    @IsClient, @IsSupplier, @IsJob
)
IF @@ROWCOUNT > 0
Select * from InComeExpenseClassification
Where [InComeExpenseClassificationID] = @@identity
