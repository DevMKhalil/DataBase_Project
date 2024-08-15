CREATE TABLE [LK].[CountriesHistory] (
    [Id]                  INT            NOT NULL,
    [Name]                NVARCHAR (500) NOT NULL,
    [NameAr]              NVARCHAR (500) NOT NULL,
    [IsActive]            BIT            NOT NULL,
    [CallingCode]         INT            NOT NULL,
    [Alpha3Code]          NVARCHAR (3)   NULL,
    [ValidTo]             DATETIME2 (7)  NOT NULL,
    [ValidFrom]           DATETIME2 (7)  NOT NULL,
    [CreatedAt]           DATETIME2 (7)  NOT NULL,
    [UpdatedAt]           DATETIME2 (7)  NULL,
    [CurrencyCode]        NVARCHAR (MAX) NULL,
    [AbsherDescription]   NVARCHAR (MAX) NULL,
    [AbsherDescriptionAr] NVARCHAR (MAX) NULL
);


GO
CREATE CLUSTERED INDEX [ix_CountriesHistory]
    ON [LK].[CountriesHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

