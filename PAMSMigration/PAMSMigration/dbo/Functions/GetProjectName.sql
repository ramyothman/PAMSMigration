-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
Create FUNCTION [dbo].[GetProjectName] 
(
	-- Add the parameters for the function here
	@NotificationTypeID int,
	@RelatedID int
)
RETURNS nvarchar(120)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result nvarchar(120)
	Declare @TempID int
	if(@RelatedID = 0)
		return '';
	-- Add the T-SQL statements to compute the return value here
	if(@NotificationTypeID = 1)
	begin
		Select @Result = ProjectName from Projects where ID = @RelatedID
	end
	else
	begin
		Select @TempID = ProjectID from ProjectsComments where ProjectCommentID = @RelatedID
		Select @Result = ProjectName from Projects where ID = @TempID
	end
	-- Return the result of the function
	RETURN @Result
END
