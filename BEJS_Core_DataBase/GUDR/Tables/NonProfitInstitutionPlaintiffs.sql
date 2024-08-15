CREATE TABLE [GUDR].[NonProfitInstitutionPlaintiffs] (
    [Id]               INT            IDENTITY (1, 1) NOT NULL,
    [RequestId]        INT            NOT NULL,
    [LicenseNumber]    BIGINT         NULL,
    [CityId]           INT            NOT NULL,
    [CountryId]        INT            NOT NULL,
    [Address_PostCode] INT            NULL,
    [CreatedAt]        DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    [CreatedById]      INT            NOT NULL,
    [UpdatedAt]        DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [UpdatedBy]        INT            NULL,
    [Name]             NVARCHAR (100) NOT NULL,
    [UnifiedNumber]    BIGINT         NOT NULL,
    [Phone]            NVARCHAR (12)  NULL,
    [Email]            NVARCHAR (50)  NULL,
    CONSTRAINT [PK_NonProfitInstitutionPlaintiffs] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_NonProfitInstitutionPlaintiffs_Cities_CityId] FOREIGN KEY ([CityId]) REFERENCES [LK].[Cities] ([Id]),
    CONSTRAINT [FK_NonProfitInstitutionPlaintiffs_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [LK].[Countries] ([Id]),
    CONSTRAINT [FK_NonProfitInstitutionPlaintiffs_GuidanceRequests_RequestId] FOREIGN KEY ([RequestId]) REFERENCES [SECR].[GuidanceRequests] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_NonProfitInstitutionPlaintiffs_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_NonProfitInstitutionPlaintiffs_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_NonProfitInstitutionPlaintiffs_UpdatedBy]
    ON [GUDR].[NonProfitInstitutionPlaintiffs]([UpdatedBy] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_NonProfitInstitutionPlaintiffs_RequestId]
    ON [GUDR].[NonProfitInstitutionPlaintiffs]([RequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_NonProfitInstitutionPlaintiffs_CreatedById]
    ON [GUDR].[NonProfitInstitutionPlaintiffs]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_NonProfitInstitutionPlaintiffs_CountryId]
    ON [GUDR].[NonProfitInstitutionPlaintiffs]([CountryId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_NonProfitInstitutionPlaintiffs_CityId]
    ON [GUDR].[NonProfitInstitutionPlaintiffs]([CityId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Guidance Non Profit Institution Plaintiff', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'NonProfitInstitutionPlaintiffs', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Guidance Non Profit Institution Plaintiff', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'NonProfitInstitutionPlaintiffs', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Guidance Non Profit Institution Plaintiff', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'NonProfitInstitutionPlaintiffs', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Guidance Non Profit Institution Plaintiff', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'NonProfitInstitutionPlaintiffs', @level2type = N'COLUMN', @level2name = N'CreatedAt';

