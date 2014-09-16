CREATE PROCEDURE [dbo].[InsertNewVisitDetails]
    @VisitId int,
    @SupplierId int,
    @ReferencedShotecNumbers nvarchar(50),
    @CustomerNotes ntext,
    @EngineerNotes ntext,
    @Satisfied nvarchar(50),
    @Reason ntext
AS
INSERT INTO [dbo].[VisitDetails] (
    [VisitId],
    [SupplierId],
    [ReferencedShotecNumbers],
    [CustomerNotes],
    [EngineerNotes],
    [Satisfied],
    [Reason])
Values (
    @VisitId,
    @SupplierId,
    @ReferencedShotecNumbers,
    @CustomerNotes,
    @EngineerNotes,
    @Satisfied,
    @Reason)
IF @@ROWCOUNT > 0
Select * from VisitDetails
Where [VisitDetailsId] = @@identity
