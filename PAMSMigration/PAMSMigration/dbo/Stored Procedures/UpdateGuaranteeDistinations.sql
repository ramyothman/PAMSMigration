-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateGuaranteeDistinations]
           @GuarnteeDistination nvarchar(50)           
           ,@oldID int 
AS
BEGIN
UPDATE [dbo].[GuaranteeDistinations]
   SET [GuarnteeDistination] = @GuarnteeDistination
 WHERE [ID] = @oldID
END
