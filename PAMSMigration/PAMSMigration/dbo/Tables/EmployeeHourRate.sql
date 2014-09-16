CREATE TABLE [dbo].[EmployeeHourRate] (
    [ID]           INT             IDENTITY (1, 1) NOT NULL,
    [Year]         INT             NULL,
    [Value]        DECIMAL (18, 2) NULL,
    [UserName]     NVARCHAR (50)   NULL,
    [ModifiedDate] DATETIME        NULL,
    [BranchID]     INT             NULL,
    [EgyptID]      INT             NULL,
    [RPEID]        INT             NULL,
    [QatarID]      INT             NULL,
    CONSTRAINT [PK_EmployeeHourRate] PRIMARY KEY CLUSTERED ([ID] ASC)
);

