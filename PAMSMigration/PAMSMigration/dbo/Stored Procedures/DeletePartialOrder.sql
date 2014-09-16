-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[DeletePartialOrder]
           @PartialOrderID int
AS
BEGIN
	DELETE FROM [dbo].[PartialOrder]
    WHERE PartialOrderID = @PartialOrderID
END
