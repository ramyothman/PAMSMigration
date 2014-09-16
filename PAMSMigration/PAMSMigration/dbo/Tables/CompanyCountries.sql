CREATE TABLE [dbo].[CompanyCountries] (
    [ID]           INT            IDENTITY (1, 1) NOT NULL,
    [CountryName]  NVARCHAR (500) NULL,
    [UserName]     NVARCHAR (50)  NULL,
    [ModifiedDate] DATETIME       NULL,
    CONSTRAINT [PK_CompanyCountries] PRIMARY KEY CLUSTERED ([ID] ASC)
);

