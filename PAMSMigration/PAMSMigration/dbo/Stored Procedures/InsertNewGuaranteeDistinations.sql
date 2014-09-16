-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewGuaranteeDistinations]
           @GuarnteeDistination nvarchar(50)           
           ,@ID int 
AS
BEGIN
INSERT INTO [dbo].[GuaranteeDistinations]
           ([ID]
           ,[GuarnteeDistination])
     VALUES
           (@ID
           ,@GuarnteeDistination)
END
