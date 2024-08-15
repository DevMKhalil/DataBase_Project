CREATE TABLE [GOV].[AgencyLegalRepresentatives] (
    [Id]                           INT                                                IDENTITY (1, 1) NOT NULL,
    [UserAccountId]                INT                                                NOT NULL,
    [RepresentationDeedId]         BIGINT                                             NOT NULL,
    [GovAgencyId]                  INT                                                NOT NULL,
    [StatusCode]                   SMALLINT                                           NOT NULL,
    [IsExternal]                   BIT                                                NOT NULL,
    [LicenseOfPracticeNumber]      BIGINT                                             NULL,
    [ResidencyTypeCode]            SMALLINT                                           NOT NULL,
    [AbsherNationalityCode]        INT                                                NOT NULL,
    [AbsherNationalityDescription] NVARCHAR (100)                                     NOT NULL,
    [FirstName]                    NVARCHAR (200)                                     NOT NULL,
    [FatherName]                   NVARCHAR (200)                                     NULL,
    [GrandFatherName]              NVARCHAR (200)                                     NULL,
    [FamilyName]                   NVARCHAR (200)                                     NOT NULL,
    [Email]                        NVARCHAR (100)                                     NOT NULL,
    [MobileNumber]                 NVARCHAR (25)                                      NULL,
    [PhoneNumber]                  NVARCHAR (25)                                      NULL,
    [BirthDate]                    DATE                                               NULL,
    [BirthDateHijri]               DECIMAL (8)                                        NULL,
    [ValidTo]                      DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom]                    DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    [CreatedAt]                    DATETIME2 (7)                                      DEFAULT (getdate()) NOT NULL,
    [CreatedById]                  INT                                                NOT NULL,
    [UpdatedAt]                    DATETIME2 (7)                                      DEFAULT (getdate()) NULL,
    [UpdatedBy]                    INT                                                NULL,
    CONSTRAINT [PK_AgencyLegalRepresentatives] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [CK_AgencyLegalRepresentatives_Mobile_OR_Phone_Number] CHECK ([MobileNumber] IS NOT NULL OR [PhoneNumber] IS NOT NULL),
    CONSTRAINT [CK_GovAgencyLegalRepresentatives_LicenseOfPracticeNumber_Required] CHECK ([IsExternal]=(0) OR [IsExternal]=(1) AND [LicenseOfPracticeNumber] IS NOT NULL),
    CONSTRAINT [FK_AgencyLegalRepresentatives_AbsherResidencyTypes_ResidencyTypeCode] FOREIGN KEY ([ResidencyTypeCode]) REFERENCES [AUTH].[AbsherResidencyTypes] ([Code]),
    CONSTRAINT [FK_AgencyLegalRepresentatives_Agencies_GovAgencyId] FOREIGN KEY ([GovAgencyId]) REFERENCES [GOV].[Agencies] ([Id]),
    CONSTRAINT [FK_AgencyLegalRepresentatives_AgencyLegalRepresentativesStatuses_StatusCode] FOREIGN KEY ([StatusCode]) REFERENCES [GOV].[AgencyLegalRepresentativesStatuses] ([Code]),
    CONSTRAINT [FK_AgencyLegalRepresentatives_Attachments_RepresentationDeedId] FOREIGN KEY ([RepresentationDeedId]) REFERENCES [ATTACH].[Attachments] ([Id]),
    CONSTRAINT [FK_AgencyLegalRepresentatives_UserAccounts_UserAccountId] FOREIGN KEY ([UserAccountId]) REFERENCES [AUTH].[UserAccounts] ([Id]),
    CONSTRAINT [FK_AgencyLegalRepresentatives_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_AgencyLegalRepresentatives_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id]),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[GOV].[AgencyLegalRepresentativesHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [IX_AgencyLegalRepresentatives_UserAccountId]
    ON [GOV].[AgencyLegalRepresentatives]([UserAccountId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_AgencyLegalRepresentatives_UpdatedBy]
    ON [GOV].[AgencyLegalRepresentatives]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_AgencyLegalRepresentatives_StatusCode]
    ON [GOV].[AgencyLegalRepresentatives]([StatusCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_AgencyLegalRepresentatives_ResidencyTypeCode]
    ON [GOV].[AgencyLegalRepresentatives]([ResidencyTypeCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_AgencyLegalRepresentatives_RepresentationDeedId]
    ON [GOV].[AgencyLegalRepresentatives]([RepresentationDeedId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_AgencyLegalRepresentatives_GovAgencyId]
    ON [GOV].[AgencyLegalRepresentatives]([GovAgencyId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_AgencyLegalRepresentatives_CreatedById]
    ON [GOV].[AgencyLegalRepresentatives]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Gov Agency Legal Representative', @level0type = N'SCHEMA', @level0name = N'GOV', @level1type = N'TABLE', @level1name = N'AgencyLegalRepresentatives', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Gov Agency Legal Representative', @level0type = N'SCHEMA', @level0name = N'GOV', @level1type = N'TABLE', @level1name = N'AgencyLegalRepresentatives', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Gov Agency Legal Representative', @level0type = N'SCHEMA', @level0name = N'GOV', @level1type = N'TABLE', @level1name = N'AgencyLegalRepresentatives', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Gov Agency Legal Representative', @level0type = N'SCHEMA', @level0name = N'GOV', @level1type = N'TABLE', @level1name = N'AgencyLegalRepresentatives', @level2type = N'COLUMN', @level2name = N'CreatedAt';

