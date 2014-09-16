-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUserPrivilegesByUserName]
	-- Add the parameters for the stored procedure here
	@UserName nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
    -- Insert statements for procedure here
	SELECT * From UserPrivileges Where UserName = @UserName
END
