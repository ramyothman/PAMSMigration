CREATE PROCEDURE [dbo].[InsertNewTimeSheetDetails]
            @SheetDetailsID int output
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
set @Cost = @Cost * Convert(decimal(18,2),Convert(decimal(18,2),@Minutes)/60)
INSERT INTO [dbo].[TimeSheetDetails]
           ([InquiryNumber]
           ,[Minutes]
           ,[SupplierID]
           ,[Cost]
           ,[SheetID]
           ,[TimePercentage])
     VALUES
           (@InquiryNumber
           ,@Minutes
           ,@SupplierID
           ,@Cost
           ,@SheetID
           ,@TimePercentage)
           
set @SheetDetailsID =  @@identity
IF @@ROWCOUNT > 0
Select * from [TimeSheetDetails]
Where [SheetDetailsID] = @SheetDetailsID
