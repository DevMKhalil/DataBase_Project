CREATE TABLE [CONFIG].[BusinessSettings] (
    [Id]                   INT                                                IDENTITY (1, 1) NOT NULL,
    [Key]                  NVARCHAR (150)                                     NOT NULL,
    [Name]                 NVARCHAR (200)                                     NOT NULL,
    [NameAr]               NVARCHAR (200)                                     NULL,
    [Value]                NVARCHAR (2000)                                    NOT NULL,
    [ValidationExpression] NVARCHAR (1000)                                    NULL,
    [IsActive]             BIT                                                NOT NULL,
    [GroupId]              INT                                                NOT NULL,
    [ValueTypeId]          INT                                                NOT NULL,
    [ValueDiscriminatorId] INT                                                NOT NULL,
    [ValidTo]              DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom]            DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    [UpdatedAt]            DATETIME2 (7)                                      DEFAULT (getdate()) NULL,
    [UpdatedBy]            INT                                                NULL,
    [CreatedAt]            DATETIME2 (7)                                      DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_BusinessSettings] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_BusinessSettings_BusinessSettingGroups_GroupId] FOREIGN KEY ([GroupId]) REFERENCES [CONFIG].[BusinessSettingGroups] ([Id]),
    CONSTRAINT [FK_BusinessSettings_BusinessSettingValueDiscriminators_ValueDiscriminatorId] FOREIGN KEY ([ValueDiscriminatorId]) REFERENCES [CONFIG].[BusinessSettingValueDiscriminators] ([Id]),
    CONSTRAINT [FK_BusinessSettings_BusinessSettingValueTypes_ValueTypeId] FOREIGN KEY ([ValueTypeId]) REFERENCES [CONFIG].[BusinessSettingValueTypes] ([Id]),
    CONSTRAINT [FK_BusinessSettings_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id]),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[CONFIG].[BusinessSettingsHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [IX_BusinessSettings_ValueTypeId]
    ON [CONFIG].[BusinessSettings]([ValueTypeId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_BusinessSettings_ValueDiscriminatorId]
    ON [CONFIG].[BusinessSettings]([ValueDiscriminatorId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_BusinessSettings_UpdatedBy]
    ON [CONFIG].[BusinessSettings]([UpdatedBy] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_BusinessSettings_Name_GroupId]
    ON [CONFIG].[BusinessSettings]([Name] ASC, [GroupId] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_BusinessSettings_Key]
    ON [CONFIG].[BusinessSettings]([Key] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_BusinessSettings_GroupId]
    ON [CONFIG].[BusinessSettings]([GroupId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Business Setting', @level0type = N'SCHEMA', @level0name = N'CONFIG', @level1type = N'TABLE', @level1name = N'BusinessSettings', @level2type = N'COLUMN', @level2name = N'CreatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Business Setting', @level0type = N'SCHEMA', @level0name = N'CONFIG', @level1type = N'TABLE', @level1name = N'BusinessSettings', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Business Setting', @level0type = N'SCHEMA', @level0name = N'CONFIG', @level1type = N'TABLE', @level1name = N'BusinessSettings', @level2type = N'COLUMN', @level2name = N'UpdatedAt';

