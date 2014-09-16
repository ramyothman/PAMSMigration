CREATE PROCEDURE [dbo].[GetByIDInComeExpenseClassification]
    @InComeExpenseClassificationID int
AS
BEGIN
Select *
From [dbo].[InComeExpenseClassification]
WHERE [InComeExpenseClassificationID] = @InComeExpenseClassificationID
END
