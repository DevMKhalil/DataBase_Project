CREATE TABLE [JACT].[TimeLimitTypes] (
    [Code]              SMALLINT       NOT NULL,
    [Name]              NVARCHAR (200) NOT NULL,
    [NameAr]            NVARCHAR (200) NOT NULL,
    [ActionCode]        SMALLINT       NOT NULL,
    [MaximumDays]       SMALLINT       NULL,
    [UrgentMaximumDays] SMALLINT       NULL,
    CONSTRAINT [PK_TimeLimitTypes] PRIMARY KEY CLUSTERED ([Code] ASC),
    CONSTRAINT [FK_TimeLimitTypes_JudicialActions_ActionCode] FOREIGN KEY ([ActionCode]) REFERENCES [JACT].[JudicialActions] ([Code])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_TimeLimitTypes_NameAr]
    ON [JACT].[TimeLimitTypes]([NameAr] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_TimeLimitTypes_Name]
    ON [JACT].[TimeLimitTypes]([Name] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TimeLimitTypes_ActionCode]
    ON [JACT].[TimeLimitTypes]([ActionCode] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of Judicial Action Time Limit Type', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'TimeLimitTypes', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of Judicial Action Time Limit Type', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'TimeLimitTypes', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code => Code of Judicial Action Time Limit Type', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'TimeLimitTypes', @level2type = N'COLUMN', @level2name = N'Code';

