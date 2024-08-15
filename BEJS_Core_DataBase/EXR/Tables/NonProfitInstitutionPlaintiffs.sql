CREATE TABLE [EXR].[NonProfitInstitutionPlaintiffs] (
    [Id]                INT             IDENTITY (1, 1) NOT NULL,
    [RequestId]         INT             NOT NULL,
    [LicenseNumber]     BIGINT          NOT NULL,
    [Phone]             NVARCHAR (12)   NOT NULL,
    [Email]             NVARCHAR (50)   NOT NULL,
    [BuildingNumber]    SMALLINT        NULL,
    [AdditionalNumber]  SMALLINT        NULL,
    [ExtraInformation]  NVARCHAR (3000) NULL,
    [CountryId]         INT             NOT NULL,
    [PostCode]          INT             NOT NULL,
    [CityId]            INT             NOT NULL,
    [District]          NVARCHAR (50)   NOT NULL,
    [Street]            NVARCHAR (50)   NOT NULL,
    [CreatedAt]         DATETIME2 (7)   DEFAULT (getdate()) NOT NULL,
    [CreatedById]       INT             NOT NULL,
    [UpdatedAt]         DATETIME2 (7)   DEFAULT (getdate()) NULL,
    [UpdatedBy]         INT             NULL,
    [Name]              NVARCHAR (100)  NOT NULL,
    [UnifiedNumber]     BIGINT          NOT NULL,
    [LicenseSourceCode] TINYINT         NOT NULL,
    [LicenseDate]       DATE            NOT NULL,
    [LicenseDateHijri]  DECIMAL (8)     NULL,
    CONSTRAINT [PK_NonProfitInstitutionPlaintiffs] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_NonProfitInstitutionPlaintiffs_Cities_CityId] FOREIGN KEY ([CityId]) REFERENCES [LK].[Cities] ([Id]),
    CONSTRAINT [FK_NonProfitInstitutionPlaintiffs_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [LK].[Countries] ([Id]),
    CONSTRAINT [FK_NonProfitInstitutionPlaintiffs_LicenseSources_LicenseSourceCode] FOREIGN KEY ([LicenseSourceCode]) REFERENCES [ExrLK].[LicenseSources] ([Code]),
    CONSTRAINT [FK_NonProfitInstitutionPlaintiffs_NonProfitInstitutionRequests_RequestId] FOREIGN KEY ([RequestId]) REFERENCES [EXR].[NonProfitInstitutionRequests] ([Id]),
    CONSTRAINT [FK_NonProfitInstitutionPlaintiffs_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_NonProfitInstitutionPlaintiffs_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_NonProfitInstitutionPlaintiffs_UpdatedBy]
    ON [EXR].[NonProfitInstitutionPlaintiffs]([UpdatedBy] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_NonProfitInstitutionPlaintiffs_RequestId]
    ON [EXR].[NonProfitInstitutionPlaintiffs]([RequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_NonProfitInstitutionPlaintiffs_LicenseSourceCode]
    ON [EXR].[NonProfitInstitutionPlaintiffs]([LicenseSourceCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_NonProfitInstitutionPlaintiffs_CreatedById]
    ON [EXR].[NonProfitInstitutionPlaintiffs]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_NonProfitInstitutionPlaintiffs_CountryId]
    ON [EXR].[NonProfitInstitutionPlaintiffs]([CountryId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_NonProfitInstitutionPlaintiffs_CityId]
    ON [EXR].[NonProfitInstitutionPlaintiffs]([CityId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Non Profit Institution Plaintiff', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'NonProfitInstitutionPlaintiffs', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Non Profit Institution Plaintiff', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'NonProfitInstitutionPlaintiffs', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Non Profit Institution Plaintiff', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'NonProfitInstitutionPlaintiffs', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Non Profit Institution Plaintiff', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'NonProfitInstitutionPlaintiffs', @level2type = N'COLUMN', @level2name = N'CreatedAt';

