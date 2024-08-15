CREATE TABLE [JACT].[ActionTypesHistory] (
    [Code]      SMALLINT      NOT NULL,
    [Name]      NVARCHAR (50) NOT NULL,
    [NameAr]    NVARCHAR (50) NOT NULL,
    [ValidTo]   DATETIME2 (7) NOT NULL,
    [ValidFrom] DATETIME2 (7) NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_ActionTypesHistory]
    ON [JACT].[ActionTypesHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

