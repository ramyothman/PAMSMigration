CREATE PROCEDURE [dbo].[DeleteJournals]
    @JournalID int
AS
Begin
 Delete [dbo].[Journals] where     [JournalID] = @JournalID
End
