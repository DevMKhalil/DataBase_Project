CREATE TABLE [JREC].[PleaRecordDecisionsHistory] (
    [Code]            SMALLINT       NOT NULL,
    [Name]            NVARCHAR (200) NOT NULL,
    [NameAr]          NVARCHAR (200) NOT NULL,
    [ValidTo]         DATETIME2 (7)  NOT NULL,
    [ValidFrom]       DATETIME2 (7)  NOT NULL,
    [IsReschedulable] BIT            NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_PleaRecordDecisionsHistory]
    ON [JREC].[PleaRecordDecisionsHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

