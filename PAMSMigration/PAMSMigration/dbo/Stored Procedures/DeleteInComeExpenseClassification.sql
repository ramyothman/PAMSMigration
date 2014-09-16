CREATE PROCEDURE [dbo].[DeleteInComeExpenseClassification]
  
    @InComeExpenseClassificationID int
 
AS
Begin
 Delete  from [dbo].[InComeExpenseClassification] where    
    [InComeExpenseClassificationID] = @InComeExpenseClassificationID 
End
