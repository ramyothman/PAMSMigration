-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDProjectGuarantee]
@ID int 
AS
BEGIN
SELECT *
 FROM [dbo].[ProjectsGuarantee]
  where [ID] = @ID
END
