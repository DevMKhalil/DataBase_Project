CREATE TABLE [JACT].[AssignedAgencies] (
    [Id]                      INT IDENTITY (1, 1) NOT NULL,
    [RequestJudicialActionId] INT NOT NULL,
    [AgencyId]                INT NOT NULL,
    CONSTRAINT [PK_AssignedAgencies] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_AssignedAgencies_Agencies_AgencyId] FOREIGN KEY ([AgencyId]) REFERENCES [GOV].[Agencies] ([Id]),
    CONSTRAINT [FK_AssignedAgencies_RequestJudicialActions_RequestJudicialActionId] FOREIGN KEY ([RequestJudicialActionId]) REFERENCES [JACT].[RequestJudicialActions] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_AssignedAgencies_RequestJudicialActionId]
    ON [JACT].[AssignedAgencies]([RequestJudicialActionId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_AssignedAgencies_AgencyId]
    ON [JACT].[AssignedAgencies]([AgencyId] ASC);

