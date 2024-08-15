CREATE TABLE [ExrLK].[StatusesHistory] (
    [Code]                      SMALLINT       NOT NULL,
    [Name]                      NVARCHAR (200) NOT NULL,
    [NameAr]                    NVARCHAR (200) NOT NULL,
    [ValidTo]                   DATETIME2 (7)  NOT NULL,
    [ValidFrom]                 DATETIME2 (7)  NOT NULL,
    [IntegrationStatusCode]     SMALLINT       NOT NULL,
    [IntegrationEfaaStatusCode] SMALLINT       NULL
);


GO
CREATE CLUSTERED INDEX [ix_StatusesHistory]
    ON [ExrLK].[StatusesHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

