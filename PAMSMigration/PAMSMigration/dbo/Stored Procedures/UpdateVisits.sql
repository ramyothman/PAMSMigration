CREATE PROCEDURE [dbo].[UpdateVisits]
    @OldVisitId int,
    @VisitNo nvarchar(50),
    @CustomerId int,
    @Finalized bit,
    @StartDateTime datetime,
    @EndDateTime datetime,
    @Accomplishment nvarchar(255),
    @PendingTasks nvarchar(255),
    @VisitComments NTEXT,
    @Place NVARCHAR(150),
    @Reason nvarchar(50),
    @VisitCopy image,
    @ReportDate datetime,
    @BranchID int
AS
UPDATE [dbo].[Visits]
SET
    VisitNo = @VisitNo,
    CustomerId = @CustomerId,
    Finalized = @Finalized,
    StartDateTime = @StartDateTime,
    EndDateTime = @EndDateTime,
    Accomplishment = @Accomplishment,
    PendingTasks = @PendingTasks,
    VisitComments = @VisitComments,
    Place = @Place,
    Reason = @Reason,
    VisitCopy = @VisitCopy,
    ReportDate = @ReportDate,
    BranchID = @BranchID
WHERE [VisitId] = @OLDVisitId
IF @@ROWCOUNT > 0
Select * From Visits 
Where [VisitId] = @OLDVisitId
