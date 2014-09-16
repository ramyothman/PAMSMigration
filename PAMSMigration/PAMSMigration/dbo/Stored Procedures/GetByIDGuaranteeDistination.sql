-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDGuaranteeDistination]
@ID int 
AS
BEGIN
	SELECT  *
  FROM [dbo].[GuaranteeDistinations]
  where [ID] = @ID
END
