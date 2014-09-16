CREATE TABLE [Serial].[SerialCombination] (
    [SerialCombinationID]  INT           IDENTITY (1, 1) NOT NULL,
    [SerialStatusID]       INT           NULL,
    [SerialComponentID]    INT           NULL,
    [SerialComponentOrder] INT           NULL,
    [CharsNo]              INT           NULL,
    [SerialDataType]       NVARCHAR (10) NULL,
    [IsAutoIncrement]      BIT           NULL,
    [AutoIncrementValue]   INT           NULL,
    [DefaultValue]         NVARCHAR (50) NULL,
    CONSTRAINT [PK_SerialCombination] PRIMARY KEY CLUSTERED ([SerialCombinationID] ASC),
    CONSTRAINT [FK_SerialCombination_SerialComponent] FOREIGN KEY ([SerialComponentID]) REFERENCES [Serial].[SerialComponent] ([SerialComponentID]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_SerialCombination_SerialStatus] FOREIGN KEY ([SerialStatusID]) REFERENCES [Serial].[SerialStatus] ([SerialStatusID]) ON DELETE CASCADE ON UPDATE CASCADE
);

