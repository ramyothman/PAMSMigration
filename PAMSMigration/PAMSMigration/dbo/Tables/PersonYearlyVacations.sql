CREATE TABLE [dbo].[PersonYearlyVacations] (
    [ID]                   INT IDENTITY (1, 1) NOT NULL,
    [PersonID]             INT NOT NULL,
    [Year]                 INT NOT NULL,
    [NumOfVacationsAnnual] INT CONSTRAINT [DF_PersonYearlyVacations_NumOfVacationsAnnual] DEFAULT ((0)) NULL,
    [NumOfVacationsCasual] INT CONSTRAINT [DF_PersonYearlyVacations_NumOfVacationsCasual] DEFAULT ((0)) NULL,
    [BranchID]             INT NULL,
    CONSTRAINT [PK_PersonYearlyVacations] PRIMARY KEY CLUSTERED ([ID] ASC)
);

