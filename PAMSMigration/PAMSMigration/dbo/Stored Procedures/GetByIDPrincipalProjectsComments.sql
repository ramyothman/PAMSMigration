-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDPrincipalProjectsComments]
	@ID int
AS
BEGIN
	SELECT *
  FROM [dbo].[PrincipalProjectsComments]
  where id = @ID
END
