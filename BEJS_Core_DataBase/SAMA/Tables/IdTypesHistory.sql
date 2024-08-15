CREATE TABLE [SAMA].[IdTypesHistory] (
    [Id]                  INT            NOT NULL,
    [Name]                NVARCHAR (500) NOT NULL,
    [NameAr]              NVARCHAR (500) NOT NULL,
    [IsActive]            BIT            NOT NULL,
    [ServiceCode]         NVARCHAR (MAX) NOT NULL,
    [CallBackServiceCode] NVARCHAR (MAX) NOT NULL,
    [GroupId]             INT            NOT NULL,
    [ValidTo]             DATETIME2 (7)  NOT NULL,
    [ValidFrom]           DATETIME2 (7)  NOT NULL,
    [CreatedAt]           DATETIME2 (7)  NOT NULL,
    [UpdatedAt]           DATETIME2 (7)  NULL
);


GO
CREATE CLUSTERED INDEX [ix_IdTypesHistory]
    ON [SAMA].[IdTypesHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

