CREATE TABLE [JACT].[RequestJudicialActions] (
    [Id]                            INT                                                IDENTITY (1, 1) NOT NULL,
    [ExecutionRequestId]            INT                                                NOT NULL,
    [ActionCode]                    SMALLINT                                           NOT NULL,
    [OrderActionId]                 INT                                                NULL,
    [DecisionActionId]              INT                                                NULL,
    [TimeLimitId]                   INT                                                NULL,
    [ValidTo]                       DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom]                     DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    [CreatedAt]                     DATETIME2 (7)                                      DEFAULT (getdate()) NOT NULL,
    [CreatedById]                   INT                                                NOT NULL,
    [UpdatedAt]                     DATETIME2 (7)                                      DEFAULT (getdate()) NULL,
    [UpdatedBy]                     INT                                                NULL,
    [RulingActionId]                INT                                                NULL,
    [SecretaryId]                   INT                                                NULL,
    [SecondaryRequestId]            INT                                                NULL,
    [ParentRequestJudicialActionId] INT                                                NULL,
    CONSTRAINT [PK_RequestJudicialActions] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_RequestJudicialActions_DecisionActions_DecisionActionId] FOREIGN KEY ([DecisionActionId]) REFERENCES [JACT].[DecisionActions] ([Id]),
    CONSTRAINT [FK_RequestJudicialActions_ExecutionRequests_ExecutionRequestId] FOREIGN KEY ([ExecutionRequestId]) REFERENCES [EXR].[ExecutionRequests] ([Id]),
    CONSTRAINT [FK_RequestJudicialActions_JudicialActions_ActionCode] FOREIGN KEY ([ActionCode]) REFERENCES [JACT].[JudicialActions] ([Code]),
    CONSTRAINT [FK_RequestJudicialActions_OrderActions_OrderActionId] FOREIGN KEY ([OrderActionId]) REFERENCES [JACT].[OrderActions] ([Id]),
    CONSTRAINT [FK_RequestJudicialActions_RequestJudicialActions_ParentRequestJudicialActionId] FOREIGN KEY ([ParentRequestJudicialActionId]) REFERENCES [JACT].[RequestJudicialActions] ([Id]),
    CONSTRAINT [FK_RequestJudicialActions_RulingActions_RulingActionId] FOREIGN KEY ([RulingActionId]) REFERENCES [JACT].[RulingActions] ([Id]),
    CONSTRAINT [FK_RequestJudicialActions_SecondaryRequests_SecondaryRequestId] FOREIGN KEY ([SecondaryRequestId]) REFERENCES [SECR].[SecondaryRequests] ([Id]),
    CONSTRAINT [FK_RequestJudicialActions_TimeLimits_TimeLimitId] FOREIGN KEY ([TimeLimitId]) REFERENCES [JACT].[TimeLimits] ([Id]),
    CONSTRAINT [FK_RequestJudicialActions_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_RequestJudicialActions_Users_SecretaryId] FOREIGN KEY ([SecretaryId]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_RequestJudicialActions_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id]),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[JACT].[RequestJudicialActionsHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [IX_RequestJudicialActions_ParentRequestJudicialActionId]
    ON [JACT].[RequestJudicialActions]([ParentRequestJudicialActionId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RequestJudicialActions_SecondaryRequestId]
    ON [JACT].[RequestJudicialActions]([SecondaryRequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RequestJudicialActions_SecretaryId]
    ON [JACT].[RequestJudicialActions]([SecretaryId] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_RequestJudicialActions_RulingActionId]
    ON [JACT].[RequestJudicialActions]([RulingActionId] ASC) WHERE ([RulingActionId] IS NOT NULL);


GO
CREATE NONCLUSTERED INDEX [IX_RequestJudicialActions_UpdatedBy]
    ON [JACT].[RequestJudicialActions]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RequestJudicialActions_TimeLimitId]
    ON [JACT].[RequestJudicialActions]([TimeLimitId] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_RequestJudicialActions_OrderActionId]
    ON [JACT].[RequestJudicialActions]([OrderActionId] ASC) WHERE ([OrderActionId] IS NOT NULL);


GO
CREATE NONCLUSTERED INDEX [IX_RequestJudicialActions_ExecutionRequestId]
    ON [JACT].[RequestJudicialActions]([ExecutionRequestId] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_RequestJudicialActions_DecisionActionId]
    ON [JACT].[RequestJudicialActions]([DecisionActionId] ASC) WHERE ([DecisionActionId] IS NOT NULL);


GO
CREATE NONCLUSTERED INDEX [IX_RequestJudicialActions_CreatedById]
    ON [JACT].[RequestJudicialActions]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RequestJudicialActions_ActionCode]
    ON [JACT].[RequestJudicialActions]([ActionCode] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Execution Request Judicial Action', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'RequestJudicialActions', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Execution Request Judicial Action', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'RequestJudicialActions', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Execution Request Judicial Action', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'RequestJudicialActions', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Execution Request Judicial Action', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'RequestJudicialActions', @level2type = N'COLUMN', @level2name = N'CreatedAt';

