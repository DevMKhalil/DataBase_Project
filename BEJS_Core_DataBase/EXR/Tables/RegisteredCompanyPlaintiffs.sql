CREATE TABLE [EXR].[RegisteredCompanyPlaintiffs] (
    [Id]               INT             IDENTITY (1, 1) NOT NULL,
    [RequestId]        INT             NOT NULL,
    [Phone]            NVARCHAR (12)   NOT NULL,
    [Email]            NVARCHAR (50)   NOT NULL,
    [BuildingNumber]   SMALLINT        NULL,
    [AdditionalNumber] SMALLINT        NULL,
    [ExtraInformation] NVARCHAR (3000) NULL,
    [CountryId]        INT             NOT NULL,
    [PostCode]         INT             NOT NULL,
    [CityId]           INT             NOT NULL,
    [District]         NVARCHAR (50)   NOT NULL,
    [Street]           NVARCHAR (50)   NOT NULL,
    [CreatedAt]        DATETIME2 (7)   DEFAULT (getdate()) NOT NULL,
    [CreatedById]      INT             NOT NULL,
    [UpdatedAt]        DATETIME2 (7)   DEFAULT (getdate()) NULL,
    [UpdatedBy]        INT             NULL,
    [Name]             NVARCHAR (200)  NOT NULL,
    [CRNumber]         BIGINT          NULL,
    [CRStartDate]      DATE            NULL,
    [CRStartDateHijri] DECIMAL (8)     NULL,
    [CREndDate]        DATE            NULL,
    [CREndDateHijri]   DECIMAL (8)     NULL,
    [UnifiedNumber]    BIGINT          NULL,
    CONSTRAINT [PK_RegisteredCompanyPlaintiffs] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [CK_RegisteredCompanyPlaintiff_CR_OR_Unified_Number] CHECK ([UnifiedNumber] IS NOT NULL OR [CRNumber] IS NOT NULL),
    CONSTRAINT [FK_RegisteredCompanyPlaintiffs_Cities_CityId] FOREIGN KEY ([CityId]) REFERENCES [LK].[Cities] ([Id]),
    CONSTRAINT [FK_RegisteredCompanyPlaintiffs_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [LK].[Countries] ([Id]),
    CONSTRAINT [FK_RegisteredCompanyPlaintiffs_RegisteredCompanyRequests_RequestId] FOREIGN KEY ([RequestId]) REFERENCES [EXR].[RegisteredCompanyRequests] ([Id]),
    CONSTRAINT [FK_RegisteredCompanyPlaintiffs_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_RegisteredCompanyPlaintiffs_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_RegisteredCompanyPlaintiffs_UpdatedBy]
    ON [EXR].[RegisteredCompanyPlaintiffs]([UpdatedBy] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_RegisteredCompanyPlaintiffs_RequestId]
    ON [EXR].[RegisteredCompanyPlaintiffs]([RequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RegisteredCompanyPlaintiffs_CreatedById]
    ON [EXR].[RegisteredCompanyPlaintiffs]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RegisteredCompanyPlaintiffs_CountryId]
    ON [EXR].[RegisteredCompanyPlaintiffs]([CountryId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RegisteredCompanyPlaintiffs_CityId]
    ON [EXR].[RegisteredCompanyPlaintiffs]([CityId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Registered Company Plaintiff', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'RegisteredCompanyPlaintiffs', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Registered Company Plaintiff', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'RegisteredCompanyPlaintiffs', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Registered Company Plaintiff', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'RegisteredCompanyPlaintiffs', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Registered Company Plaintiff', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'RegisteredCompanyPlaintiffs', @level2type = N'COLUMN', @level2name = N'CreatedAt';

