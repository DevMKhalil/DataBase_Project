CREATE TABLE [EXR].[UnRegisteredCompanyPlaintiffs] (
    [Id]               INT             IDENTITY (1, 1) NOT NULL,
    [RequestId]        INT             NOT NULL,
    [Phone]            NVARCHAR (50)   NOT NULL,
    [Email]            NVARCHAR (50)   NOT NULL,
    [City]             NVARCHAR (50)   NOT NULL,
    [District]         NVARCHAR (50)   NULL,
    [Street]           NVARCHAR (50)   NULL,
    [BuildingNumber]   SMALLINT        NULL,
    [AdditionalNumber] SMALLINT        NULL,
    [ExtraInformation] NVARCHAR (3000) NULL,
    [CountryId]        INT             NOT NULL,
    [PostCode]         INT             NOT NULL,
    [CreatedAt]        DATETIME2 (7)   DEFAULT (getdate()) NOT NULL,
    [CreatedById]      INT             NOT NULL,
    [UpdatedAt]        DATETIME2 (7)   DEFAULT (getdate()) NULL,
    [UpdatedBy]        INT             NULL,
    [Name]             NVARCHAR (MAX)  NULL,
    [MISALicenseNo]    BIGINT          NULL,
    [CRNumber]         NVARCHAR (50)   NULL,
    [CRStartDate]      DATE            NULL,
    [CRStartDateHijri] DECIMAL (8)     NULL,
    [CREndDate]        DATE            NULL,
    [CREndDateHijri]   DECIMAL (8)     NULL,
    CONSTRAINT [PK_UnRegisteredCompanyPlaintiffs] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_UnRegisteredCompanyPlaintiffs_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [LK].[Countries] ([Id]),
    CONSTRAINT [FK_UnRegisteredCompanyPlaintiffs_UnRegisteredCompanyRequests_RequestId] FOREIGN KEY ([RequestId]) REFERENCES [EXR].[UnRegisteredCompanyRequests] ([Id]),
    CONSTRAINT [FK_UnRegisteredCompanyPlaintiffs_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_UnRegisteredCompanyPlaintiffs_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_UnRegisteredCompanyPlaintiffs_UpdatedBy]
    ON [EXR].[UnRegisteredCompanyPlaintiffs]([UpdatedBy] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_UnRegisteredCompanyPlaintiffs_RequestId]
    ON [EXR].[UnRegisteredCompanyPlaintiffs]([RequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_UnRegisteredCompanyPlaintiffs_CreatedById]
    ON [EXR].[UnRegisteredCompanyPlaintiffs]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_UnRegisteredCompanyPlaintiffs_CountryId]
    ON [EXR].[UnRegisteredCompanyPlaintiffs]([CountryId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Un Registered Company Plaintiff', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'UnRegisteredCompanyPlaintiffs', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Un Registered Company Plaintiff', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'UnRegisteredCompanyPlaintiffs', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Un Registered Company Plaintiff', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'UnRegisteredCompanyPlaintiffs', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Un Registered Company Plaintiff', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'UnRegisteredCompanyPlaintiffs', @level2type = N'COLUMN', @level2name = N'CreatedAt';

