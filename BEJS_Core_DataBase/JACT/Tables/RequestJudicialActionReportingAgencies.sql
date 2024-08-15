CREATE TABLE [JACT].[RequestJudicialActionReportingAgencies] (
    [Id]                       INT      IDENTITY (1, 1) NOT NULL,
    [RequestJudicialActionId]  INT      NOT NULL,
    [JudicialActionAgencyCode] SMALLINT NOT NULL,
    CONSTRAINT [PK_RequestJudicialActionReportingAgencies] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_RequestJudicialActionReportingAgencies_ReportingAgencies_JudicialActionAgencyCode] FOREIGN KEY ([JudicialActionAgencyCode]) REFERENCES [JACT].[ReportingAgencies] ([Code]),
    CONSTRAINT [FK_RequestJudicialActionReportingAgencies_RequestJudicialActions_RequestJudicialActionId] FOREIGN KEY ([RequestJudicialActionId]) REFERENCES [JACT].[RequestJudicialActions] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_RequestJudicialActionReportingAgencies_RequestJudicialActionId]
    ON [JACT].[RequestJudicialActionReportingAgencies]([RequestJudicialActionId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RequestJudicialActionReportingAgencies_JudicialActionAgencyCode]
    ON [JACT].[RequestJudicialActionReportingAgencies]([JudicialActionAgencyCode] ASC);

