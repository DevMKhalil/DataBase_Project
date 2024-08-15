CREATE TABLE [ExrLK].[IntegrationStatusesHistory] (
    [Code]          SMALLINT       NOT NULL,
    [Name]          NVARCHAR (200) NOT NULL,
    [NameAr]        NVARCHAR (200) NOT NULL,
    [EnablePayment] BIT            NOT NULL,
    [ValidTo]       DATETIME2 (7)  NOT NULL,
    [ValidFrom]     DATETIME2 (7)  NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_IntegrationStatusesHistory]
    ON [ExrLK].[IntegrationStatusesHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

