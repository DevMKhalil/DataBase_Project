CREATE TABLE [JACT].[JudicialActions] (
    [Code]             SMALLINT                                           NOT NULL,
    [Name]             NVARCHAR (300)                                     NOT NULL,
    [NameAr]           NVARCHAR (300)                                     NOT NULL,
    [TypeCode]         SMALLINT                                           NOT NULL,
    [ResultStatusCode] SMALLINT                                           NOT NULL,
    [GuidanceTemplate] NVARCHAR (MAX)                                     NULL,
    [ValidTo]          DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom]        DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    [IsRepeatable]     BIT                                                DEFAULT (CONVERT([bit],(0))) NOT NULL,
    CONSTRAINT [PK_JudicialActions] PRIMARY KEY CLUSTERED ([Code] ASC),
    CONSTRAINT [FK_JudicialActions_ActionTypes_TypeCode] FOREIGN KEY ([TypeCode]) REFERENCES [JACT].[ActionTypes] ([Code]),
    CONSTRAINT [FK_JudicialActions_Statuses_ResultStatusCode] FOREIGN KEY ([ResultStatusCode]) REFERENCES [ExrLK].[Statuses] ([Code]),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[JACT].[JudicialActionsHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [IX_JudicialActions_TypeCode]
    ON [JACT].[JudicialActions]([TypeCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_JudicialActions_ResultStatusCode]
    ON [JACT].[JudicialActions]([ResultStatusCode] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_JudicialActions_NameAr]
    ON [JACT].[JudicialActions]([NameAr] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_JudicialActions_Name]
    ON [JACT].[JudicialActions]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of Judicial Action', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'JudicialActions', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of Judicial Action', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'JudicialActions', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code => Code of Judicial Action', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'JudicialActions', @level2type = N'COLUMN', @level2name = N'Code';

