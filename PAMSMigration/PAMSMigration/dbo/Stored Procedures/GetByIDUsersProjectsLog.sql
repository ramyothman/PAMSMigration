-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDUsersProjectsLog]
	@UserID INT,
	@ProjectLogID INT 
AS
BEGIN
SELECT * FROM  [dbo].[UsersProjectsLog]
WHERE UserID = @UserID AND ProjectLogID = @ProjectLogID
END
