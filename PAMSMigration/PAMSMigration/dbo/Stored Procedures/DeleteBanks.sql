CREATE PROCEDURE [dbo].[DeleteBanks]
    @ID int
AS
Begin
Delete BankBranches where BankID =  @ID
 Delete [dbo].[Banks] where     [ID] = @ID
End
