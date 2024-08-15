CREATE TABLE [JACT].[GuidanceRejectionDecisions] (
    [Id]                INT         IDENTITY (1, 1) NOT NULL,
    [DecisionActionId]  INT         NOT NULL,
    [PlaintiffId]       INT         NOT NULL,
    [GuidanceDate]      DATE        NOT NULL,
    [GuidanceDateHijri] DECIMAL (8) NULL,
    CONSTRAINT [PK_GuidanceRejectionDecisions] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_GuidanceRejectionDecisions_DecisionActions_DecisionActionId] FOREIGN KEY ([DecisionActionId]) REFERENCES [JACT].[DecisionActions] ([Id]),
    CONSTRAINT [FK_GuidanceRejectionDecisions_GuidanceRejectionDecisionPlaintiff_PlaintiffId] FOREIGN KEY ([PlaintiffId]) REFERENCES [JACT].[GuidanceRejectionDecisionPlaintiff] ([Id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_GuidanceRejectionDecisions_PlaintiffId]
    ON [JACT].[GuidanceRejectionDecisions]([PlaintiffId] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_GuidanceRejectionDecisions_DecisionActionId]
    ON [JACT].[GuidanceRejectionDecisions]([DecisionActionId] ASC);

