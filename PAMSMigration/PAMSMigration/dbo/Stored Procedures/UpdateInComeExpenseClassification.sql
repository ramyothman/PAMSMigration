CREATE PROCEDURE [dbo].[UpdateInComeExpenseClassification]
    @CurrencyID int,
    @HasOpenBalance bit,
    @OldInComeExpenseClassificationID int,
    @InComeExpenseClassificationID2 int,
    @IsDebit bit,
    @Name nvarchar(max),
    @IsClient bit , 
    @IsSupplier bit , 
    @IsJob bit
AS
UPDATE [dbo].[InComeExpenseClassification]
SET
    CurrencyID = @CurrencyID,
    HasOpenBalance = @HasOpenBalance,
    InComeExpenseClassificationID2 = @InComeExpenseClassificationID2,
    IsDebit = @IsDebit,
    Name = @Name,
    IsClient = @IsClient  , 
    IsSupplier=@IsSupplier  , 
    IsJob = @IsJob 
WHERE [InComeExpenseClassificationID] = @OLDInComeExpenseClassificationID
IF @@ROWCOUNT > 0
Select * From InComeExpenseClassification 
Where [InComeExpenseClassificationID] = @OLDInComeExpenseClassificationID
