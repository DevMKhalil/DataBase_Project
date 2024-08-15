CREATE TABLE [JACT].[AssignedActions] (
    [Id]                              INT IDENTITY (1, 1) NOT NULL,
    [RequestJudicialActionId]         INT NOT NULL,
    [AssignedRequestJudicialActionId] INT NOT NULL,
    CONSTRAINT [PK_AssignedActions] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_AssignedActions_RequestJudicialActions_AssignedRequestJudicialActionId] FOREIGN KEY ([AssignedRequestJudicialActionId]) REFERENCES [JACT].[RequestJudicialActions] ([Id]),
    CONSTRAINT [FK_AssignedActions_RequestJudicialActions_RequestJudicialActionId] FOREIGN KEY ([RequestJudicialActionId]) REFERENCES [JACT].[RequestJudicialActions] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_AssignedActions_RequestJudicialActionId]
    ON [JACT].[AssignedActions]([RequestJudicialActionId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_AssignedActions_AssignedRequestJudicialActionId]
    ON [JACT].[AssignedActions]([AssignedRequestJudicialActionId] ASC);

