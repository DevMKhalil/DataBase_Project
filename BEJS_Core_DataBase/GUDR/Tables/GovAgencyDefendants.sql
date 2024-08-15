CREATE TABLE [GUDR].[GovAgencyDefendants] (
    [Id]                       INT            IDENTITY (1, 1) NOT NULL,
    [RequestId]                INT            NOT NULL,
    [AgencyId]                 INT            NOT NULL,
    [CityId]                   INT            NOT NULL,
    [CountryId]                INT            NOT NULL,
    [Address_District]         NVARCHAR (MAX) NULL,
    [Address_Street]           NVARCHAR (MAX) NULL,
    [Address_BuildingNumber]   SMALLINT       NULL,
    [Address_PostCode]         INT            NULL,
    [Address_AdditionalNumber] SMALLINT       NULL,
    [Address_ExtraInformation] NVARCHAR (MAX) NULL,
    [CreatedAt]                DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    [CreatedById]              INT            NOT NULL,
    [UpdatedAt]                DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [UpdatedBy]                INT            NULL,
    CONSTRAINT [PK_GovAgencyDefendants] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_GovAgencyDefendants_Agencies_AgencyId] FOREIGN KEY ([AgencyId]) REFERENCES [GOV].[Agencies] ([Id]),
    CONSTRAINT [FK_GovAgencyDefendants_Cities_CityId] FOREIGN KEY ([CityId]) REFERENCES [LK].[Cities] ([Id]),
    CONSTRAINT [FK_GovAgencyDefendants_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [LK].[Countries] ([Id]),
    CONSTRAINT [FK_GovAgencyDefendants_GuidanceRequests_RequestId] FOREIGN KEY ([RequestId]) REFERENCES [SECR].[GuidanceRequests] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_GovAgencyDefendants_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_GovAgencyDefendants_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_GovAgencyDefendants_UpdatedBy]
    ON [GUDR].[GovAgencyDefendants]([UpdatedBy] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_GovAgencyDefendants_RequestId]
    ON [GUDR].[GovAgencyDefendants]([RequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_GovAgencyDefendants_CreatedById]
    ON [GUDR].[GovAgencyDefendants]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_GovAgencyDefendants_CountryId]
    ON [GUDR].[GovAgencyDefendants]([CountryId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_GovAgencyDefendants_CityId]
    ON [GUDR].[GovAgencyDefendants]([CityId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_GovAgencyDefendants_AgencyId]
    ON [GUDR].[GovAgencyDefendants]([AgencyId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update GuidanceGov Agency Defendant', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'GovAgencyDefendants', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of GuidanceGov Agency Defendant', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'GovAgencyDefendants', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create GuidanceGov Agency Defendant', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'GovAgencyDefendants', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of GuidanceGov Agency Defendant', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'GovAgencyDefendants', @level2type = N'COLUMN', @level2name = N'CreatedAt';

