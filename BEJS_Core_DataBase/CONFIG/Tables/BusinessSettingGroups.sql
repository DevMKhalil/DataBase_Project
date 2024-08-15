CREATE TABLE [CONFIG].[BusinessSettingGroups] (
    [Id]        INT                                                IDENTITY (1, 1) NOT NULL,
    [Name]      NVARCHAR (50)                                      NOT NULL,
    [NameAr]    NVARCHAR (50)                                      NOT NULL,
    [ValidTo]   DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom] DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    [UpdatedAt] DATETIME2 (7)                                      DEFAULT (getdate()) NULL,
    [UpdatedBy] INT                                                NULL,
    [CreatedAt] DATETIME2 (7)                                      DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_BusinessSettingGroups] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_BusinessSettingGroups_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id]),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[CONFIG].[BusinessSettingGroupsHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [IX_BusinessSettingGroups_UpdatedBy]
    ON [CONFIG].[BusinessSettingGroups]([UpdatedBy] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Business Setting Group', @level0type = N'SCHEMA', @level0name = N'CONFIG', @level1type = N'TABLE', @level1name = N'BusinessSettingGroups', @level2type = N'COLUMN', @level2name = N'CreatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Business Setting Group', @level0type = N'SCHEMA', @level0name = N'CONFIG', @level1type = N'TABLE', @level1name = N'BusinessSettingGroups', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Business Setting Group', @level0type = N'SCHEMA', @level0name = N'CONFIG', @level1type = N'TABLE', @level1name = N'BusinessSettingGroups', @level2type = N'COLUMN', @level2name = N'UpdatedAt';

