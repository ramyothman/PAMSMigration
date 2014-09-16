CREATE TABLE [dbo].[Roles] (
    [ID]               INT           IDENTITY (1, 1) NOT NULL,
    [Name]             NVARCHAR (50) NULL,
    [IsActive]         BIT           NULL,
    [LimitedSuppliers] BIT           NULL,
    [BranchID]         INT           NULL,
    [EgyptID]          INT           NULL,
    [RPEID]            INT           NULL,
    [QatarID]          INT           NULL,
    [IsPrincipal]      BIT           NULL,
    CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED ([ID] ASC)
);

