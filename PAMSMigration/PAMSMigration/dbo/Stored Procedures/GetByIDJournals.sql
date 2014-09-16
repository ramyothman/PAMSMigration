CREATE PROCEDURE [dbo].[GetByIDJournals]
    @JournalID int
AS
BEGIN
Select *
From [dbo].[Journals]
WHERE [JournalID] = @JournalID
END
