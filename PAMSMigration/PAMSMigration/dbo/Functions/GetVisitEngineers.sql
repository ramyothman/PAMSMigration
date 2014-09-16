-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetVisitEngineers]
(
    @VisitID int
)
RETURNS nvarchar(500)
AS
BEGIN
Declare @Result nvarchar(500)
set @Result = ''
DECLARE @ResponsibleEngineer nvarchar(100)
DECLARE @ResponsibleEngineerCursor CURSOR
SET @ResponsibleEngineerCursor = CURSOR FOR
  SELECT [DisplayName]
  FROM [dbo].[GetAllVisitEngineers]
 where [VisitID] = @VisitID
OPEN @ResponsibleEngineerCursor
FETCH NEXT
FROM @ResponsibleEngineerCursor INTO @ResponsibleEngineer
WHILE @@FETCH_STATUS = 0
BEGIN
if(len( LTRIM(RTRIM(@Result))) = 0)
  set @Result = @ResponsibleEngineer
else
 set @Result = ', ' + @ResponsibleEngineer
 
FETCH NEXT
FROM @ResponsibleEngineerCursor INTO @ResponsibleEngineer
END
CLOSE @ResponsibleEngineerCursor
DEALLOCATE @ResponsibleEngineerCursor
Return @Result
END
