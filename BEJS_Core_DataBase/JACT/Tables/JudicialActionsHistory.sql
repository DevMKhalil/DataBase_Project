CREATE TABLE [JACT].[JudicialActionsHistory] (
    [Code]             SMALLINT       NOT NULL,
    [Name]             NVARCHAR (300) NOT NULL,
    [NameAr]           NVARCHAR (300) NOT NULL,
    [TypeCode]         SMALLINT       NOT NULL,
    [ResultStatusCode] SMALLINT       NOT NULL,
    [GuidanceTemplate] NVARCHAR (MAX) NULL,
    [ValidTo]          DATETIME2 (7)  NOT NULL,
    [ValidFrom]        DATETIME2 (7)  NOT NULL,
    [IsRepeatable]     BIT            NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_JudicialActionsHistory]
    ON [JACT].[JudicialActionsHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

