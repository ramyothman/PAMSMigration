-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,,>
-- Description:	@Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewEmployeeHourRate]
            @ID int out
           ,@Year int
           ,@Value decimal(18,2)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
           ,@BranchID int
AS
BEGIN
INSERT INTO [dbo].[EmployeeHourRate]
           ([Year]
           ,[Value]
           ,[UserName]
           ,[ModifiedDate]
           ,[BranchID])
     VALUES
           (@Year
           ,@Value
           ,@UserName
           ,@ModifiedDate
           ,@BranchID)
           
update [dbo].TimeSheetDetails
set Cost = @Value *Convert(decimal(18,2), Minutes / Convert(decimal(18,2),60))
where [SheetID] IN(select ID from [dbo].[TimeSheet] where YEAR(SheetDate) = @Year and BranchID= @BranchID)
set @ID = @@identity
END
