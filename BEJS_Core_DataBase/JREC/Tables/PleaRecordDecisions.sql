CREATE TABLE [JREC].[PleaRecordDecisions] (
    [Code]            SMALLINT                                           NOT NULL,
    [Name]            NVARCHAR (200)                                     NOT NULL,
    [NameAr]          NVARCHAR (200)                                     NOT NULL,
    [ValidTo]         DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom]       DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    [IsReschedulable] BIT                                                DEFAULT (CONVERT([bit],(0))) NOT NULL,
    CONSTRAINT [PK_PleaRecordDecisions] PRIMARY KEY CLUSTERED ([Code] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[JREC].[PleaRecordDecisionsHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_PleaRecordDecisions_NameAr]
    ON [JREC].[PleaRecordDecisions]([NameAr] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_PleaRecordDecisions_Name]
    ON [JREC].[PleaRecordDecisions]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of Judicial Plea Record Decision', @level0type = N'SCHEMA', @level0name = N'JREC', @level1type = N'TABLE', @level1name = N'PleaRecordDecisions', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of Judicial Plea Record Decision', @level0type = N'SCHEMA', @level0name = N'JREC', @level1type = N'TABLE', @level1name = N'PleaRecordDecisions', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code => Code of Judicial Plea Record Decision', @level0type = N'SCHEMA', @level0name = N'JREC', @level1type = N'TABLE', @level1name = N'PleaRecordDecisions', @level2type = N'COLUMN', @level2name = N'Code';

