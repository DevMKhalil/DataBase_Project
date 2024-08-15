CREATE TABLE [ExrLK].[ReturnReasonGroups] (
    [Code]      SMALLINT                                           NOT NULL,
    [Name]      NVARCHAR (200)                                     NOT NULL,
    [NameAr]    NVARCHAR (200)                                     NOT NULL,
    [ValidTo]   DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom] DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    CONSTRAINT [PK_ReturnReasonGroups] PRIMARY KEY CLUSTERED ([Code] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[ExrLK].[ReturnReasonGroupsHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ReturnReasonGroups_NameAr]
    ON [ExrLK].[ReturnReasonGroups]([NameAr] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ReturnReasonGroups_Name]
    ON [ExrLK].[ReturnReasonGroups]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of ReturnReason Group', @level0type = N'SCHEMA', @level0name = N'ExrLK', @level1type = N'TABLE', @level1name = N'ReturnReasonGroups', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of ReturnReason Group', @level0type = N'SCHEMA', @level0name = N'ExrLK', @level1type = N'TABLE', @level1name = N'ReturnReasonGroups', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code => Code of ReturnReason Group', @level0type = N'SCHEMA', @level0name = N'ExrLK', @level1type = N'TABLE', @level1name = N'ReturnReasonGroups', @level2type = N'COLUMN', @level2name = N'Code';

