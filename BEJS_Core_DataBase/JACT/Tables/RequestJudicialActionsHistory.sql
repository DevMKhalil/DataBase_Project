CREATE TABLE [JACT].[RequestJudicialActionsHistory] (
    [Id]                            INT           NOT NULL,
    [ExecutionRequestId]            INT           NOT NULL,
    [ActionCode]                    SMALLINT      NOT NULL,
    [OrderActionId]                 INT           NULL,
    [DecisionActionId]              INT           NULL,
    [TimeLimitId]                   INT           NULL,
    [ValidTo]                       DATETIME2 (7) NOT NULL,
    [ValidFrom]                     DATETIME2 (7) NOT NULL,
    [CreatedAt]                     DATETIME2 (7) NOT NULL,
    [CreatedById]                   INT           NOT NULL,
    [UpdatedAt]                     DATETIME2 (7) NULL,
    [UpdatedBy]                     INT           NULL,
    [RulingActionId]                INT           NULL,
    [SecretaryId]                   INT           NULL,
    [SecondaryRequestId]            INT           NULL,
    [ParentRequestJudicialActionId] INT           NULL
);


GO
CREATE CLUSTERED INDEX [ix_RequestJudicialActionsHistory]
    ON [JACT].[RequestJudicialActionsHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

