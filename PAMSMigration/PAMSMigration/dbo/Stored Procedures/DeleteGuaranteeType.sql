-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteGuaranteeType]
          @ID int 
AS
BEGIN
Delete from GuranteeTypes where ID = @ID
END
