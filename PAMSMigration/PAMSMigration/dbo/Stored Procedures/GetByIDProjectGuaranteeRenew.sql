-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDProjectGuaranteeRenew]
@ID int 
AS
BEGIN
SELECT *
  FROM[dbo].[ProjectsGuaranteeRenews]
  where [ID] = @ID
END
