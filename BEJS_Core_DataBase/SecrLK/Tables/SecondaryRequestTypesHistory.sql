CREATE TABLE [SecrLK].[SecondaryRequestTypesHistory] (
    [Code]      SMALLINT       NOT NULL,
    [Name]      NVARCHAR (400) NOT NULL,
    [NameAr]    NVARCHAR (400) NOT NULL,
    [ValidTo]   DATETIME2 (7)  NOT NULL,
    [ValidFrom] DATETIME2 (7)  NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_SecondaryRequestTypesHistory]
    ON [SecrLK].[SecondaryRequestTypesHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

