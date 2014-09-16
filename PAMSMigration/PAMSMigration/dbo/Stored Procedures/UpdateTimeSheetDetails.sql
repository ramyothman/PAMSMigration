CREATE PROCEDURE [dbo].[UpdateTimeSheetDetails]
            @OldSheetDetailsID int 
           ,@InquiryNumber nvarchar(50)
           ,@Minutes int
           ,@SupplierID int
           ,@SheetID int
           ,@TimePercentage decimal(5,2)
AS
declare @Cost int 
declare @SheetYear int 
select @SheetYear = YEAR(SheetDate) from [dbo].[TimeSheet] where ID = @SheetID
select @Cost = Value from [dbo].[EmployeeHourRate] 
where [Year] = @SheetYear
print ('Cost') print(@Cost)
print ('Year') print(@SheetYear)
set @Cost = @Cost * Convert(decimal(18,2),Convert(decimal(18,2),@Minutes)/60)
print ('Cost') print(@Cost)
  UPDATE [dbo].[TimeSheetDetails]
   SET [InquiryNumber] = @InquiryNumber
      ,[Minutes] = @Minutes
      ,[SupplierID] = @SupplierID
      ,[SheetID] = @SheetID
      ,[Cost] = @Cost
      ,[TimePercentage] = @TimePercentage
 WHERE [SheetDetailsID] = @OldSheetDetailsID
IF @@ROWCOUNT > 0
Select * From [dbo].[TimeSheetDetails] 
Where [SheetDetailsID] = @OldSheetDetailsID
