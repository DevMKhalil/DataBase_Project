CREATE TABLE [GUDR].[UnregisteredCompanyPlaintiffs] (
    [Id]               INT            IDENTITY (1, 1) NOT NULL,
    [RequestId]        INT            NOT NULL,
    [City]             NVARCHAR (50)  NOT NULL,
    [CountryId]        INT            NOT NULL,
    [Address_PostCode] INT            NULL,
    [CreatedAt]        DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    [CreatedById]      INT            NOT NULL,
    [UpdatedAt]        DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [UpdatedBy]        INT            NULL,
    [Name]             NVARCHAR (100) NOT NULL,
    [MISALicenseNo]    BIGINT         NULL,
    [CRNumber]         NVARCHAR (50)  NULL,
    [CRStartDate]      DATE           NULL,
    [CRStartDateHijri] DECIMAL (8)    NULL,
    [CREndDate]        DATE           NULL,
    [CREndDateHijri]   DECIMAL (8)    NULL,
    [Phone]            NVARCHAR (50)  NOT NULL,
    [Email]            NVARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_UnregisteredCompanyPlaintiffs] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_UnregisteredCompanyPlaintiffs_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [LK].[Countries] ([Id]),
    CONSTRAINT [FK_UnregisteredCompanyPlaintiffs_GuidanceRequests_RequestId] FOREIGN KEY ([RequestId]) REFERENCES [SECR].[GuidanceRequests] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_UnregisteredCompanyPlaintiffs_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_UnregisteredCompanyPlaintiffs_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_UnregisteredCompanyPlaintiffs_UpdatedBy]
    ON [GUDR].[UnregisteredCompanyPlaintiffs]([UpdatedBy] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_UnregisteredCompanyPlaintiffs_RequestId]
    ON [GUDR].[UnregisteredCompanyPlaintiffs]([RequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_UnregisteredCompanyPlaintiffs_CreatedById]
    ON [GUDR].[UnregisteredCompanyPlaintiffs]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_UnregisteredCompanyPlaintiffs_CountryId]
    ON [GUDR].[UnregisteredCompanyPlaintiffs]([CountryId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Guidance Unregistered Company Plaintiff', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'UnregisteredCompanyPlaintiffs', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Guidance Unregistered Company Plaintiff', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'UnregisteredCompanyPlaintiffs', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Guidance Unregistered Company Plaintiff', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'UnregisteredCompanyPlaintiffs', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Guidance Unregistered Company Plaintiff', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'UnregisteredCompanyPlaintiffs', @level2type = N'COLUMN', @level2name = N'CreatedAt';

