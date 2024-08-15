CREATE TABLE [JREC].[JudicialRulingBriefs] (
    [Code]      SMALLINT                                           NOT NULL,
    [Name]      NVARCHAR (200)                                     NOT NULL,
    [NameAr]    NVARCHAR (200)                                     NOT NULL,
    [ValidTo]   DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom] DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    CONSTRAINT [PK_JudicialRulingBriefs] PRIMARY KEY CLUSTERED ([Code] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[JREC].[JudicialRulingBriefsHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_JudicialRulingBriefs_NameAr]
    ON [JREC].[JudicialRulingBriefs]([NameAr] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_JudicialRulingBriefs_Name]
    ON [JREC].[JudicialRulingBriefs]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of Judicial Ruling Brief', @level0type = N'SCHEMA', @level0name = N'JREC', @level1type = N'TABLE', @level1name = N'JudicialRulingBriefs', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of Judicial Ruling Brief', @level0type = N'SCHEMA', @level0name = N'JREC', @level1type = N'TABLE', @level1name = N'JudicialRulingBriefs', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code => Code of Judicial Ruling Brief', @level0type = N'SCHEMA', @level0name = N'JREC', @level1type = N'TABLE', @level1name = N'JudicialRulingBriefs', @level2type = N'COLUMN', @level2name = N'Code';

