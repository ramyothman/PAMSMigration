-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CheckConcurrentUsers]
	@UserID int,
	@IPAddress nvarchar(50),
	@MaxNumOfMins int,
	@NumberOfLiecense int,
	@Result bit out,
	@BranchID int
AS
BEGIN
	UPDATE [dbo].[ConcurrentUsers]
   SET [IsIn] = 'False'
      ,[LogoutDate] = GETDATE()
      ,[UserName] = 'System'
      ,[ModifiedDate] = GETDATE()
   WHERE [dbo].[GetConcurrentUsersDateDifferenceByMin] (PulseDate) >= @MaxNumOfMins and [IsIn]='True'
   
   print([dbo].[GetNumberOfConcurrentUsers]())
   
   if(@NumberOfLiecense >[dbo].[GetNumberOfConcurrentUsers]())
       set @Result = 'True'
   else    
       set @Result = 'False'
   
   if(@Result = 'False')
      set @Result = [dbo].[CheckIsUserLogin](@UserID,@IPAddress,@MaxNumOfMins)
      
   print (@Result)
END
