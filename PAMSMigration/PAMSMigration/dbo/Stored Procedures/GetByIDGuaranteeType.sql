-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDGuaranteeType]
@ID int 
AS
BEGIN
	SELECT *
  FROM [dbo].[GuaranteeTypes]
  where [ID] = @ID
END
