-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeletePartialLosts] 
	@PartialOrderID int
	AS
BEGIN
	DELETE FROM [dbo].[PartialLost]
      WHERE PartialOrderID = @PartialOrderID
END
