CREATE TABLE [ExrGov].[NonProfitInstitutionDefendants] (
    [Id]                INT             IDENTITY (1, 1) NOT NULL,
    [RequestId]         INT             NOT NULL,
    [LicenseNumber]     BIGINT          NULL,
    [CityId]            INT             NOT NULL,
    [CountryId]         INT             NOT NULL,
    [District]          NVARCHAR (50)   NULL,
    [Street]            NVARCHAR (50)   NULL,
    [BuildingNumber]    SMALLINT        NULL,
    [PostCode]          INT             NULL,
    [AdditionalNumber]  SMALLINT        NULL,
    [ExtraInformation]  NVARCHAR (3000) NULL,
    [CreatedAt]         DATETIME2 (7)   DEFAULT (getdate()) NOT NULL,
    [CreatedById]       INT             NOT NULL,
    [UpdatedAt]         DATETIME2 (7)   DEFAULT (getdate()) NULL,
    [UpdatedBy]         INT             NULL,
    [Name]              NVARCHAR (100)  NOT NULL,
    [UnifiedNumber]     BIGINT          NOT NULL,
    [LicenseSourceCode] TINYINT         NULL,
    [LicenseDate]       DATE            NULL,
    [LicenseDateHijri]  DECIMAL (8)     NULL,
    [Email]             NVARCHAR (50)   NULL,
    [Phone]             NVARCHAR (12)   NULL,
    CONSTRAINT [PK_NonProfitInstitutionDefendants] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_NonProfitInstitutionDefendants_Cities_CityId] FOREIGN KEY ([CityId]) REFERENCES [LK].[Cities] ([Id]),
    CONSTRAINT [FK_NonProfitInstitutionDefendants_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [LK].[Countries] ([Id]),
    CONSTRAINT [FK_NonProfitInstitutionDefendants_LicenseSources_LicenseSourceCode] FOREIGN KEY ([LicenseSourceCode]) REFERENCES [ExrLK].[LicenseSources] ([Code]),
    CONSTRAINT [FK_NonProfitInstitutionDefendants_Requests_RequestId] FOREIGN KEY ([RequestId]) REFERENCES [ExrGov].[Requests] ([Id]),
    CONSTRAINT [FK_NonProfitInstitutionDefendants_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_NonProfitInstitutionDefendants_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [AK_NonProfitInstitutionDefendants_RequestId_UnifiedNumber] UNIQUE NONCLUSTERED ([RequestId] ASC, [UnifiedNumber] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_NonProfitInstitutionDefendants_UpdatedBy]
    ON [ExrGov].[NonProfitInstitutionDefendants]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_NonProfitInstitutionDefendants_LicenseSourceCode]
    ON [ExrGov].[NonProfitInstitutionDefendants]([LicenseSourceCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_NonProfitInstitutionDefendants_CreatedById]
    ON [ExrGov].[NonProfitInstitutionDefendants]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_NonProfitInstitutionDefendants_CountryId]
    ON [ExrGov].[NonProfitInstitutionDefendants]([CountryId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_NonProfitInstitutionDefendants_CityId]
    ON [ExrGov].[NonProfitInstitutionDefendants]([CityId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Non Profit Institution Defendant', @level0type = N'SCHEMA', @level0name = N'ExrGov', @level1type = N'TABLE', @level1name = N'NonProfitInstitutionDefendants', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Non Profit Institution Defendant', @level0type = N'SCHEMA', @level0name = N'ExrGov', @level1type = N'TABLE', @level1name = N'NonProfitInstitutionDefendants', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Non Profit Institution Defendant', @level0type = N'SCHEMA', @level0name = N'ExrGov', @level1type = N'TABLE', @level1name = N'NonProfitInstitutionDefendants', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Non Profit Institution Defendant', @level0type = N'SCHEMA', @level0name = N'ExrGov', @level1type = N'TABLE', @level1name = N'NonProfitInstitutionDefendants', @level2type = N'COLUMN', @level2name = N'CreatedAt';

