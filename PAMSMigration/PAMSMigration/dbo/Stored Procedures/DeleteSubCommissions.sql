CREATE PROCEDURE [dbo].[DeleteSubCommissions]
    @SubCommissionID int
AS
Begin
 Delete [dbo].[SubCommissions] where     [SubCommissionID] = @SubCommissionID
End
