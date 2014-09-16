/****** Object:  UserDefinedFunction [dbo].[GetEmployeeHoursCost]    Script Date: 03/20/2013 12:55:44 ******/
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	Used in Timesheet managements
-- =============================================
CREATE FUNCTION [dbo].[GetEmployeeHoursCost]
(
    @Year int,
    @NumberOfHours decimal(9,2),
    @BranchID int
)
RETURNS decimal(18,2)
AS
BEGIN
Declare @Result Decimal(18,2)
Declare @HourRate decimal(18,2)
SELECT @HourRate =[Value]     
  FROM [dbo].[EmployeeHourRate]
  where [Year] = @Year and BranchID = @BranchID
set @Result = @HourRate * @NumberOfHours
return @Result
END
