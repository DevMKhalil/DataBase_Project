CREATE TABLE [GUDR].[GovAgencyPlaintiffs] (
    [Id]               INT           IDENTITY (1, 1) NOT NULL,
    [RequestId]        INT           NOT NULL,
    [AgencyId]         INT           NOT NULL,
    [CityId]           INT           NOT NULL,
    [CountryId]        INT           NOT NULL,
    [Address_PostCode] INT           NULL,
    [CreatedAt]        DATETIME2 (7) DEFAULT (getdate()) NOT NULL,
    [CreatedById]      INT           NOT NULL,
    [UpdatedAt]        DATETIME2 (7) DEFAULT (getdate()) NULL,
    [UpdatedBy]        INT           NULL,
    CONSTRAINT [PK_GovAgencyPlaintiffs] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_GovAgencyPlaintiffs_Agencies_AgencyId] FOREIGN KEY ([AgencyId]) REFERENCES [GOV].[Agencies] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_GovAgencyPlaintiffs_Cities_CityId] FOREIGN KEY ([CityId]) REFERENCES [LK].[Cities] ([Id]),
    CONSTRAINT [FK_GovAgencyPlaintiffs_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [LK].[Countries] ([Id]),
    CONSTRAINT [FK_GovAgencyPlaintiffs_GuidanceRequests_RequestId] FOREIGN KEY ([RequestId]) REFERENCES [SECR].[GuidanceRequests] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_GovAgencyPlaintiffs_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_GovAgencyPlaintiffs_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_GovAgencyPlaintiffs_UpdatedBy]
    ON [GUDR].[GovAgencyPlaintiffs]([UpdatedBy] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_GovAgencyPlaintiffs_RequestId]
    ON [GUDR].[GovAgencyPlaintiffs]([RequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_GovAgencyPlaintiffs_CreatedById]
    ON [GUDR].[GovAgencyPlaintiffs]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_GovAgencyPlaintiffs_CountryId]
    ON [GUDR].[GovAgencyPlaintiffs]([CountryId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_GovAgencyPlaintiffs_CityId]
    ON [GUDR].[GovAgencyPlaintiffs]([CityId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_GovAgencyPlaintiffs_AgencyId]
    ON [GUDR].[GovAgencyPlaintiffs]([AgencyId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update GuidanceGov Agency Plaintiff', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'GovAgencyPlaintiffs', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of GuidanceGov Agency Plaintiff', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'GovAgencyPlaintiffs', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create GuidanceGov Agency Plaintiff', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'GovAgencyPlaintiffs', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of GuidanceGov Agency Plaintiff', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'GovAgencyPlaintiffs', @level2type = N'COLUMN', @level2name = N'CreatedAt';

