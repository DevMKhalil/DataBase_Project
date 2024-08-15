CREATE TABLE [JACT].[LeavedJudicialActions] (
    [Id]                            INT IDENTITY (1, 1) NOT NULL,
    [RequestJudicialActionId]       INT NOT NULL,
    [LeavedRequestJudicialActionId] INT NOT NULL,
    CONSTRAINT [PK_LeavedJudicialActions] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_LeavedJudicialActions_RequestJudicialActions_LeavedRequestJudicialActionId] FOREIGN KEY ([LeavedRequestJudicialActionId]) REFERENCES [JACT].[RequestJudicialActions] ([Id]),
    CONSTRAINT [FK_LeavedJudicialActions_RequestJudicialActions_RequestJudicialActionId] FOREIGN KEY ([RequestJudicialActionId]) REFERENCES [JACT].[RequestJudicialActions] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_LeavedJudicialActions_RequestJudicialActionId]
    ON [JACT].[LeavedJudicialActions]([RequestJudicialActionId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_LeavedJudicialActions_LeavedRequestJudicialActionId]
    ON [JACT].[LeavedJudicialActions]([LeavedRequestJudicialActionId] ASC);

