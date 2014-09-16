CREATE PROCEDURE [dbo].[DeleteCurrencies]
    @ID nvarchar(50)
AS
Begin
 Delete [dbo].[Currencies] where     [ID] = @ID
End
