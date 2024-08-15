CREATE TABLE [JACT].[RejectedEnforcementItems] (
    [Id]                               INT    IDENTITY (1, 1) NOT NULL,
    [ExecutionRequestJudicialActionId] INT    NOT NULL,
    [EnforcementItemId]                BIGINT NOT NULL,
    CONSTRAINT [PK_RejectedEnforcementItems] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_RejectedEnforcementItems_EnforcementItems_EnforcementItemId] FOREIGN KEY ([EnforcementItemId]) REFERENCES [EXR].[EnforcementItems] ([Id]),
    CONSTRAINT [FK_RejectedEnforcementItems_RequestJudicialActions_ExecutionRequestJudicialActionId] FOREIGN KEY ([ExecutionRequestJudicialActionId]) REFERENCES [JACT].[RequestJudicialActions] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_RejectedEnforcementItems_ExecutionRequestJudicialActionId]
    ON [JACT].[RejectedEnforcementItems]([ExecutionRequestJudicialActionId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RejectedEnforcementItems_EnforcementItemId]
    ON [JACT].[RejectedEnforcementItems]([EnforcementItemId] ASC);

