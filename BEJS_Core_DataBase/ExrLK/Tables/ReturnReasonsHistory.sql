CREATE TABLE [ExrLK].[ReturnReasonsHistory] (
    [Code]      SMALLINT       NOT NULL,
    [Name]      NVARCHAR (400) NOT NULL,
    [NameAr]    NVARCHAR (400) NOT NULL,
    [GroupId]   SMALLINT       NOT NULL,
    [ValidTo]   DATETIME2 (7)  NOT NULL,
    [ValidFrom] DATETIME2 (7)  NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_ReturnReasonsHistory]
    ON [ExrLK].[ReturnReasonsHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

