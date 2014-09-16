CREATE PROCEDURE [dbo].[DeleteTimeSheetDetails]
    @SheetDetailsID int
AS
Begin
DELETE FROM [dbo].[TimeSheetDetails]
      WHERE SheetDetailsID =@SheetDetailsID
End
