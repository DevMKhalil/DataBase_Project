CREATE TABLE [JACT].[Defendants] (
    [Id]                               INT             IDENTITY (1, 1) NOT NULL,
    [ExecutionRequestJudicialActionId] INT             NOT NULL,
    [GovAgencyDefendantId]             INT             NULL,
    [CharityDefendantId]               INT             NULL,
    [IndividualDefendantId]            INT             NULL,
    [NonProfitInstitutionDefendantId]  INT             NULL,
    [WaqfDefendantId]                  INT             NULL,
    [RegisteredCompanyDefendantId]     INT             NULL,
    [UnRegisteredCompanyDefendantId]   INT             NULL,
    [Amount]                           DECIMAL (18, 2) NULL,
    [DhamenBuyerId]                    INT             NULL,
    [FacilityDefendantId]              INT             NULL,
    CONSTRAINT [PK_Defendants] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Defendants_Buyers_DhamenBuyerId] FOREIGN KEY ([DhamenBuyerId]) REFERENCES [DHMN].[Buyers] ([Id]),
    CONSTRAINT [FK_Defendants_CharityDefendants_CharityDefendantId] FOREIGN KEY ([CharityDefendantId]) REFERENCES [ExrGov].[CharityDefendants] ([Id]),
    CONSTRAINT [FK_Defendants_FacilityDefendants_FacilityDefendantId] FOREIGN KEY ([FacilityDefendantId]) REFERENCES [ExrGov].[FacilityDefendants] ([Id]),
    CONSTRAINT [FK_Defendants_GovAgencyDefendants_GovAgencyDefendantId] FOREIGN KEY ([GovAgencyDefendantId]) REFERENCES [EXR].[GovAgencyDefendants] ([Id]),
    CONSTRAINT [FK_Defendants_IndividualDefendants_IndividualDefendantId] FOREIGN KEY ([IndividualDefendantId]) REFERENCES [ExrGov].[IndividualDefendants] ([Id]),
    CONSTRAINT [FK_Defendants_NonProfitInstitutionDefendants_NonProfitInstitutionDefendantId] FOREIGN KEY ([NonProfitInstitutionDefendantId]) REFERENCES [ExrGov].[NonProfitInstitutionDefendants] ([Id]),
    CONSTRAINT [FK_Defendants_RegisteredCompanyDefendants_RegisteredCompanyDefendantId] FOREIGN KEY ([RegisteredCompanyDefendantId]) REFERENCES [ExrGov].[RegisteredCompanyDefendants] ([Id]),
    CONSTRAINT [FK_Defendants_RequestJudicialActions_ExecutionRequestJudicialActionId] FOREIGN KEY ([ExecutionRequestJudicialActionId]) REFERENCES [JACT].[RequestJudicialActions] ([Id]),
    CONSTRAINT [FK_Defendants_UnRegisteredCompanyDefendants_UnRegisteredCompanyDefendantId] FOREIGN KEY ([UnRegisteredCompanyDefendantId]) REFERENCES [ExrGov].[UnRegisteredCompanyDefendants] ([Id]),
    CONSTRAINT [FK_Defendants_WaqfDefendants_WaqfDefendantId] FOREIGN KEY ([WaqfDefendantId]) REFERENCES [ExrGov].[WaqfDefendants] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Defendants_FacilityDefendantId]
    ON [JACT].[Defendants]([FacilityDefendantId] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Defendants_DhamenBuyerId]
    ON [JACT].[Defendants]([DhamenBuyerId] ASC) WHERE ([DhamenBuyerId] IS NOT NULL);


GO
CREATE NONCLUSTERED INDEX [IX_Defendants_WaqfDefendantId]
    ON [JACT].[Defendants]([WaqfDefendantId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Defendants_UnRegisteredCompanyDefendantId]
    ON [JACT].[Defendants]([UnRegisteredCompanyDefendantId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Defendants_RegisteredCompanyDefendantId]
    ON [JACT].[Defendants]([RegisteredCompanyDefendantId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Defendants_NonProfitInstitutionDefendantId]
    ON [JACT].[Defendants]([NonProfitInstitutionDefendantId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Defendants_IndividualDefendantId]
    ON [JACT].[Defendants]([IndividualDefendantId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Defendants_GovAgencyDefendantId]
    ON [JACT].[Defendants]([GovAgencyDefendantId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Defendants_ExecutionRequestJudicialActionId]
    ON [JACT].[Defendants]([ExecutionRequestJudicialActionId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Defendants_CharityDefendantId]
    ON [JACT].[Defendants]([CharityDefendantId] ASC);

