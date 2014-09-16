CREATE PROCEDURE [dbo].[InsertNewVisits]
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
INSERT INTO [dbo].[Visits] (
    [VisitNo],
    [CustomerId],
    [Finalized],
    [StartDateTime],
    [EndDateTime],
    [Accomplishment],
    [PendingTasks],
    [VisitComments],
    [Place],
    [Reason],
    [VisitCopy],
    [ReportDate],
    [BranchID])
Values (
    @VisitNo,
    @CustomerId,
    @Finalized,
    @StartDateTime,
    @EndDateTime,
    @Accomplishment,
    @PendingTasks,
    @VisitComments,
    @Place,
    @Reason,
    @VisitCopy,
    @ReportDate,
    @BranchID)
IF @@ROWCOUNT > 0
Select * from Visits
Where [VisitId] = @@identity
