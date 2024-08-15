CREATE TABLE [CONFIG].[BusinessSettingValueDiscriminators] (
    [Id]        INT                                                IDENTITY (1, 1) NOT NULL,
    [Name]      NVARCHAR (500)                                     NOT NULL,
    [NameAr]    NVARCHAR (500)                                     NOT NULL,
    [IsActive]  BIT                                                NOT NULL,
    [ValidTo]   DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom] DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    [CreatedAt] DATETIME2 (7)                                      DEFAULT (getdate()) NOT NULL,
    [UpdatedAt] DATETIME2 (7)                                      NULL,
    CONSTRAINT [PK_BusinessSettingValueDiscriminators] PRIMARY KEY CLUSTERED ([Id] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[CONFIG].[BusinessSettingValueDiscriminatorsHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_BusinessSettingValueDiscriminators_NameAr]
    ON [CONFIG].[BusinessSettingValueDiscriminators]([NameAr] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_BusinessSettingValueDiscriminators_Name]
    ON [CONFIG].[BusinessSettingValueDiscriminators]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Business Setting Discriminator', @level0type = N'SCHEMA', @level0name = N'CONFIG', @level1type = N'TABLE', @level1name = N'BusinessSettingValueDiscriminators', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Business Setting Discriminator', @level0type = N'SCHEMA', @level0name = N'CONFIG', @level1type = N'TABLE', @level1name = N'BusinessSettingValueDiscriminators', @level2type = N'COLUMN', @level2name = N'CreatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of Business Setting Discriminator', @level0type = N'SCHEMA', @level0name = N'CONFIG', @level1type = N'TABLE', @level1name = N'BusinessSettingValueDiscriminators', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of Business Setting Discriminator', @level0type = N'SCHEMA', @level0name = N'CONFIG', @level1type = N'TABLE', @level1name = N'BusinessSettingValueDiscriminators', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Id => Id of Business Setting Discriminator', @level0type = N'SCHEMA', @level0name = N'CONFIG', @level1type = N'TABLE', @level1name = N'BusinessSettingValueDiscriminators', @level2type = N'COLUMN', @level2name = N'Id';

