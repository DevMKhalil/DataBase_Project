CREATE TABLE [ATTACH].[FileStatusHistory] (
    [Code]      INT            NOT NULL,
    [Name]      NVARCHAR (100) NOT NULL,
    [NameAr]    NVARCHAR (100) NOT NULL,
    [ValidTo]   DATETIME2 (7)  NOT NULL,
    [ValidFrom] DATETIME2 (7)  NOT NULL,
    [CreatedAt] DATETIME2 (7)  NOT NULL,
    [UpdatedBy] INT            NULL,
    [UpdatedAt] DATETIME2 (7)  NULL
);


GO
CREATE CLUSTERED INDEX [ix_FileStatusHistory]
    ON [ATTACH].[FileStatusHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

