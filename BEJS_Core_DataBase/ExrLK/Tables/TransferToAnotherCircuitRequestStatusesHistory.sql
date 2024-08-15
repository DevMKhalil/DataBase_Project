CREATE TABLE [ExrLK].[TransferToAnotherCircuitRequestStatusesHistory] (
    [Code]      SMALLINT       NOT NULL,
    [Name]      NVARCHAR (200) NOT NULL,
    [NameAr]    NVARCHAR (200) NOT NULL,
    [ValidTo]   DATETIME2 (7)  NOT NULL,
    [ValidFrom] DATETIME2 (7)  NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_TransferToAnotherCircuitRequestStatusesHistory]
    ON [ExrLK].[TransferToAnotherCircuitRequestStatusesHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

