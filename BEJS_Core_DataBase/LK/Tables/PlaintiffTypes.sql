CREATE TABLE [LK].[PlaintiffTypes] (
    [Code]      SMALLINT                                           NOT NULL,
    [Name]      NVARCHAR (400)                                     NOT NULL,
    [NameAr]    NVARCHAR (400)                                     NOT NULL,
    [ValidTo]   DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom] DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    CONSTRAINT [PK_PlaintiffTypes] PRIMARY KEY CLUSTERED ([Code] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[LK].[PlaintiffTypesHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_PlaintiffTypes_NameAr]
    ON [LK].[PlaintiffTypes]([NameAr] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_PlaintiffTypes_Name]
    ON [LK].[PlaintiffTypes]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of Plaintiff Type', @level0type = N'SCHEMA', @level0name = N'LK', @level1type = N'TABLE', @level1name = N'PlaintiffTypes', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of Plaintiff Type', @level0type = N'SCHEMA', @level0name = N'LK', @level1type = N'TABLE', @level1name = N'PlaintiffTypes', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code => Code of Plaintiff Type', @level0type = N'SCHEMA', @level0name = N'LK', @level1type = N'TABLE', @level1name = N'PlaintiffTypes', @level2type = N'COLUMN', @level2name = N'Code';

