CREATE TABLE [CONFIG].[BusinessSettingGroupsHistory] (
    [Id]        INT           NOT NULL,
    [Name]      NVARCHAR (50) NOT NULL,
    [NameAr]    NVARCHAR (50) NOT NULL,
    [ValidTo]   DATETIME2 (7) NOT NULL,
    [ValidFrom] DATETIME2 (7) NOT NULL,
    [UpdatedAt] DATETIME2 (7) NULL,
    [UpdatedBy] INT           NULL,
    [CreatedAt] DATETIME2 (7) NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_BusinessSettingGroupsHistory]
    ON [CONFIG].[BusinessSettingGroupsHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

