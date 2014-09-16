CREATE TABLE [dbo].[SecurityActivationCodes] (
    [SecurityActivationCodeId] INT           IDENTITY (1, 1) NOT NULL,
    [Code]                     NVARCHAR (50) CONSTRAINT [DF_SecurityActivationCodes_Code] DEFAULT (newid()) NULL,
    [IsActive]                 BIT           NULL,
    [LicenseNumber]            INT           NULL,
    [UsedLicenseNumber]        INT           NULL,
    CONSTRAINT [PK_SecurityActivationCodes] PRIMARY KEY CLUSTERED ([SecurityActivationCodeId] ASC)
);

