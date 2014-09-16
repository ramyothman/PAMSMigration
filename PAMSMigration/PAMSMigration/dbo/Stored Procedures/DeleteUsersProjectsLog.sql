-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteUsersProjectsLog]
	@UserID INT,
	@ProjectLogID int
AS
BEGIN
DELETE [dbo].[UsersProjectsLog]
WHERE UserID = @UserID AND ProjectLogID = @ProjectLogID
END
