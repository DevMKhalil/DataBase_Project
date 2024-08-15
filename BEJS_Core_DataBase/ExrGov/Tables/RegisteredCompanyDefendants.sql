CREATE TABLE [ExrGov].[RegisteredCompanyDefendants] (
    [Id]               INT             IDENTITY (1, 1) NOT NULL,
    [RequestId]        INT             NOT NULL,
    [CityId]           INT             NOT NULL,
    [CountryId]        INT             NOT NULL,
    [District]         NVARCHAR (50)   NULL,
    [Street]           NVARCHAR (50)   NULL,
    [BuildingNumber]   SMALLINT        NULL,
    [PostCode]         INT             NULL,
    [AdditionalNumber] SMALLINT        NULL,
    [ExtraInformation] NVARCHAR (3000) NULL,
    [CreatedAt]        DATETIME2 (7)   DEFAULT (getdate()) NOT NULL,
    [CreatedById]      INT             NOT NULL,
    [UpdatedAt]        DATETIME2 (7)   DEFAULT (getdate()) NULL,
    [UpdatedBy]        INT             NULL,
    [Name]             NVARCHAR (100)  NOT NULL,
    [CRNumber]         BIGINT          NULL,
    [CRStartDate]      DATE            NULL,
    [CRStartDateHijri] DECIMAL (8)     NULL,
    [CREndDate]        DATE            NULL,
    [CREndDateHijri]   DECIMAL (8)     NULL,
    [UnifiedNumber]    BIGINT          NULL,
    [Email]            NVARCHAR (50)   NULL,
    [Phone]            NVARCHAR (12)   NULL,
    CONSTRAINT [PK_RegisteredCompanyDefendants] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [CK_RegisteredCompanyDefendants_CR_OR_Unified_Number] CHECK ([UnifiedNumber] IS NOT NULL OR [CRNumber] IS NOT NULL),
    CONSTRAINT [FK_RegisteredCompanyDefendants_Cities_CityId] FOREIGN KEY ([CityId]) REFERENCES [LK].[Cities] ([Id]),
    CONSTRAINT [FK_RegisteredCompanyDefendants_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [LK].[Countries] ([Id]),
    CONSTRAINT [FK_RegisteredCompanyDefendants_Requests_RequestId] FOREIGN KEY ([RequestId]) REFERENCES [ExrGov].[Requests] ([Id]),
    CONSTRAINT [FK_RegisteredCompanyDefendants_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_RegisteredCompanyDefendants_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [AK_RegisteredCompanyDefendants_RequestId_Id] UNIQUE NONCLUSTERED ([RequestId] ASC, [Id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_RegisteredCompanyDefendants_UpdatedBy]
    ON [ExrGov].[RegisteredCompanyDefendants]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RegisteredCompanyDefendants_CreatedById]
    ON [ExrGov].[RegisteredCompanyDefendants]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RegisteredCompanyDefendants_CountryId]
    ON [ExrGov].[RegisteredCompanyDefendants]([CountryId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RegisteredCompanyDefendants_CityId]
    ON [ExrGov].[RegisteredCompanyDefendants]([CityId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Registered Company Defendant', @level0type = N'SCHEMA', @level0name = N'ExrGov', @level1type = N'TABLE', @level1name = N'RegisteredCompanyDefendants', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Registered Company Defendant', @level0type = N'SCHEMA', @level0name = N'ExrGov', @level1type = N'TABLE', @level1name = N'RegisteredCompanyDefendants', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Registered Company Defendant', @level0type = N'SCHEMA', @level0name = N'ExrGov', @level1type = N'TABLE', @level1name = N'RegisteredCompanyDefendants', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Registered Company Defendant', @level0type = N'SCHEMA', @level0name = N'ExrGov', @level1type = N'TABLE', @level1name = N'RegisteredCompanyDefendants', @level2type = N'COLUMN', @level2name = N'CreatedAt';

