-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,,>
-- Description:	@Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateEmployeeHourRate]
            @OldID int out
           ,@Year int
           ,@Value decimal(18,2)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
           ,@BranchID int
AS
BEGIN
UPDATE [dbo].[EmployeeHourRate]
   SET [Year] = @Year
      ,[Value] = @Value
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
      ,[BranchID] = @BranchID
 WHERE ID = @OldID
           
update [dbo].TimeSheetDetails
set Cost = @Value * Convert(decimal(18,2),Minutes / Convert(decimal(18,2),60))
where [SheetID] IN(select ID from [dbo].[TimeSheet] where YEAR(SheetDate) = @Year and BranchID = @BranchID)
END
