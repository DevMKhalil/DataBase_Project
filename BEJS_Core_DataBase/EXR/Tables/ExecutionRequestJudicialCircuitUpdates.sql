CREATE TABLE [EXR].[ExecutionRequestJudicialCircuitUpdates] (
    [Id]                 INT           IDENTITY (1, 1) NOT NULL,
    [ExecutionRequestId] INT           NOT NULL,
    [JudicialCircuitId]  INT           NOT NULL,
    [CreatedAt]          DATETIME2 (7) DEFAULT (getdate()) NOT NULL,
    [CreatedById]        INT           NOT NULL,
    CONSTRAINT [PK_ExecutionRequestJudicialCircuitUpdates] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ExecutionRequestJudicialCircuitUpdates_Circuits_JudicialCircuitId] FOREIGN KEY ([JudicialCircuitId]) REFERENCES [JCRT].[Circuits] ([Id]),
    CONSTRAINT [FK_ExecutionRequestJudicialCircuitUpdates_ExecutionRequests_ExecutionRequestId] FOREIGN KEY ([ExecutionRequestId]) REFERENCES [EXR].[ExecutionRequests] ([Id]),
    CONSTRAINT [FK_ExecutionRequestJudicialCircuitUpdates_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_ExecutionRequestJudicialCircuitUpdates_JudicialCircuitId]
    ON [EXR].[ExecutionRequestJudicialCircuitUpdates]([JudicialCircuitId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ExecutionRequestJudicialCircuitUpdates_ExecutionRequestId]
    ON [EXR].[ExecutionRequestJudicialCircuitUpdates]([ExecutionRequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ExecutionRequestJudicialCircuitUpdates_CreatedById]
    ON [EXR].[ExecutionRequestJudicialCircuitUpdates]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Execution Request Judicial Circuit Update', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'ExecutionRequestJudicialCircuitUpdates', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Execution Request Judicial Circuit Update', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'ExecutionRequestJudicialCircuitUpdates', @level2type = N'COLUMN', @level2name = N'CreatedAt';

