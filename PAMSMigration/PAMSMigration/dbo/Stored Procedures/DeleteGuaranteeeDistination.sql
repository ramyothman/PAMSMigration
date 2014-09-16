-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteGuaranteeeDistination]
          @ID int 
AS
BEGIN
Delete from GuaranteeDistinations where ID = @ID
END
