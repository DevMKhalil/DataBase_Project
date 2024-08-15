CREATE TABLE [AUTH].[RolesHistory] (
    [Code]       INT            NOT NULL,
    [Name]       NVARCHAR (200) NOT NULL,
    [NameAr]     NVARCHAR (200) NOT NULL,
    [IsExternal] BIT            NOT NULL,
    [IsActive]   BIT            NOT NULL,
    [ValidTo]    DATETIME2 (7)  NOT NULL,
    [ValidFrom]  DATETIME2 (7)  NOT NULL,
    [CreatedAt]  DATETIME2 (7)  NOT NULL,
    [UpdatedBy]  INT            NULL,
    [UpdatedAt]  DATETIME2 (7)  NULL
);


GO
CREATE CLUSTERED INDEX [ix_RolesHistory]
    ON [AUTH].[RolesHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

