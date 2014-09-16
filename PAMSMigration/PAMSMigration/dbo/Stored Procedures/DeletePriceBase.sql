CREATE PROCEDURE [dbo].[DeletePriceBase]
    @ID nvarchar(50)
AS
Begin
 Delete [dbo].[PriceBase] where     [ID] = @ID
End
