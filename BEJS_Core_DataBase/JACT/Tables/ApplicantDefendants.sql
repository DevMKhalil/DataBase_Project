CREATE TABLE [JACT].[ApplicantDefendants] (
    [Id]                              INT IDENTITY (1, 1) NOT NULL,
    [GovAgencyDefendantId]            INT NULL,
    [CharityDefendantId]              INT NULL,
    [IndividualDefendantId]           INT NULL,
    [NonProfitInstitutionDefendantId] INT NULL,
    [WaqfDefendantId]                 INT NULL,
    [RegisteredCompanyDefendantId]    INT NULL,
    [UnRegisteredCompanyDefendantId]  INT NULL,
    [FacilityDefendantId]             INT NULL,
    CONSTRAINT [PK_ApplicantDefendants] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ApplicantDefendants_CharityDefendants_CharityDefendantId] FOREIGN KEY ([CharityDefendantId]) REFERENCES [ExrGov].[CharityDefendants] ([Id]),
    CONSTRAINT [FK_ApplicantDefendants_FacilityDefendants_FacilityDefendantId] FOREIGN KEY ([FacilityDefendantId]) REFERENCES [ExrGov].[FacilityDefendants] ([Id]),
    CONSTRAINT [FK_ApplicantDefendants_GovAgencyDefendants_GovAgencyDefendantId] FOREIGN KEY ([GovAgencyDefendantId]) REFERENCES [EXR].[GovAgencyDefendants] ([Id]),
    CONSTRAINT [FK_ApplicantDefendants_IndividualDefendants_IndividualDefendantId] FOREIGN KEY ([IndividualDefendantId]) REFERENCES [ExrGov].[IndividualDefendants] ([Id]),
    CONSTRAINT [FK_ApplicantDefendants_NonProfitInstitutionDefendants_NonProfitInstitutionDefendantId] FOREIGN KEY ([NonProfitInstitutionDefendantId]) REFERENCES [ExrGov].[NonProfitInstitutionDefendants] ([Id]),
    CONSTRAINT [FK_ApplicantDefendants_RegisteredCompanyDefendants_RegisteredCompanyDefendantId] FOREIGN KEY ([RegisteredCompanyDefendantId]) REFERENCES [ExrGov].[RegisteredCompanyDefendants] ([Id]),
    CONSTRAINT [FK_ApplicantDefendants_UnRegisteredCompanyDefendants_UnRegisteredCompanyDefendantId] FOREIGN KEY ([UnRegisteredCompanyDefendantId]) REFERENCES [ExrGov].[UnRegisteredCompanyDefendants] ([Id]),
    CONSTRAINT [FK_ApplicantDefendants_WaqfDefendants_WaqfDefendantId] FOREIGN KEY ([WaqfDefendantId]) REFERENCES [ExrGov].[WaqfDefendants] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_ApplicantDefendants_FacilityDefendantId]
    ON [JACT].[ApplicantDefendants]([FacilityDefendantId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ApplicantDefendants_WaqfDefendantId]
    ON [JACT].[ApplicantDefendants]([WaqfDefendantId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ApplicantDefendants_UnRegisteredCompanyDefendantId]
    ON [JACT].[ApplicantDefendants]([UnRegisteredCompanyDefendantId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ApplicantDefendants_RegisteredCompanyDefendantId]
    ON [JACT].[ApplicantDefendants]([RegisteredCompanyDefendantId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ApplicantDefendants_NonProfitInstitutionDefendantId]
    ON [JACT].[ApplicantDefendants]([NonProfitInstitutionDefendantId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ApplicantDefendants_IndividualDefendantId]
    ON [JACT].[ApplicantDefendants]([IndividualDefendantId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ApplicantDefendants_GovAgencyDefendantId]
    ON [JACT].[ApplicantDefendants]([GovAgencyDefendantId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ApplicantDefendants_CharityDefendantId]
    ON [JACT].[ApplicantDefendants]([CharityDefendantId] ASC);

