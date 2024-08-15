CREATE TABLE [SecrLK].[SecondaryRequestReturnReasonGroups] (
    [Code]      SMALLINT                                           NOT NULL,
    [Name]      NVARCHAR (400)                                     NOT NULL,
    [NameAr]    NVARCHAR (400)                                     NOT NULL,
    [ValidTo]   DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom] DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    CONSTRAINT [PK_SecondaryRequestReturnReasonGroups] PRIMARY KEY CLUSTERED ([Code] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[SecrLK].[SecondaryRequestReturnReasonGroupsHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_SecondaryRequestReturnReasonGroups_NameAr]
    ON [SecrLK].[SecondaryRequestReturnReasonGroups]([NameAr] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_SecondaryRequestReturnReasonGroups_Name]
    ON [SecrLK].[SecondaryRequestReturnReasonGroups]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of Secondary Request Return Reasons Group', @level0type = N'SCHEMA', @level0name = N'SecrLK', @level1type = N'TABLE', @level1name = N'SecondaryRequestReturnReasonGroups', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of Secondary Request Return Reasons Group', @level0type = N'SCHEMA', @level0name = N'SecrLK', @level1type = N'TABLE', @level1name = N'SecondaryRequestReturnReasonGroups', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code => Code of Secondary Request Return Reasons Group', @level0type = N'SCHEMA', @level0name = N'SecrLK', @level1type = N'TABLE', @level1name = N'SecondaryRequestReturnReasonGroups', @level2type = N'COLUMN', @level2name = N'Code';

