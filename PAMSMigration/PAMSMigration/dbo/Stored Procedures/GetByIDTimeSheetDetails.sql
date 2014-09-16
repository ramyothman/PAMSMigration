CREATE PROCEDURE [dbo].[GetByIDTimeSheetDetails]
    @SheetDetailsID nvarchar(50)
AS
BEGIN
SELECT *
  FROM [dbo].[TimeSheetDetails]
where SheetDetailsID = @SheetDetailsID
END
