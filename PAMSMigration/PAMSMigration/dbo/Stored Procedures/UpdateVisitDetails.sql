CREATE PROCEDURE [dbo].[UpdateVisitDetails]
    @OldVisitDetailsId int,
    @VisitId int,
    @SupplierId int,
    @ReferencedShotecNumbers nvarchar(50),
    @CustomerNotes ntext,
    @EngineerNotes ntext,
    @Satisfied nvarchar(50),
    @Reason ntext
AS
UPDATE [dbo].[VisitDetails]
SET
    VisitId = @VisitId,
    SupplierId = @SupplierId,
    ReferencedShotecNumbers = @ReferencedShotecNumbers,
    CustomerNotes = @CustomerNotes,
    EngineerNotes = @EngineerNotes,
    Satisfied = @Satisfied,
    Reason = @Reason
WHERE [VisitDetailsId] = @OLDVisitDetailsId
IF @@ROWCOUNT > 0
Select * From VisitDetails 
Where [VisitDetailsId] = @OLDVisitDetailsId
