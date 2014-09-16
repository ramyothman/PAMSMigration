-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateReportsStructures]
      @ReportName nvarchar(100)
      ,@ItemName nvarchar(50)
      ,@Path nvarchar(3000)
      ,@DisplayName nvarchar(100)
      ,@Structure ntext
      ,@BranchID int
      ,@oldID int
AS
BEGIN

if(@oldID <> 0 )
begin
	UPDATE [dbo].[ReportsStructures]
   SET [ReportName] = @ReportName
      ,[ItemName] = @ItemName
      ,[Path] = @Path
      ,[DisplayName] = @DisplayName
      ,[Structure] = @Structure
      ,[BranchID] = @BranchID
 WHERE ID = @oldID
 end
 else
 begin
 INSERT INTO ReportsStructures ( ReportName, ItemName, Path, Structure, DisplayName, BranchID)
 VALUES     (@ReportName,@ItemName,@Path, @Structure ,@DisplayName,@BranchID)
 end
 
END
