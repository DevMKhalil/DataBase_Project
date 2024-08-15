CREATE TABLE [GUDR].[RegisteredCompanyPlaintiffs] (
    [Id]               INT            IDENTITY (1, 1) NOT NULL,
    [RequestId]        INT            NOT NULL,
    [Name]             NVARCHAR (100) NOT NULL,
    [CRNumber]         BIGINT         NOT NULL,
    [UnifiedNumber]    BIGINT         NULL,
    [Phone]            NVARCHAR (12)  NULL,
    [Email]            NVARCHAR (50)  NULL,
    [City]             INT            NOT NULL,
    [CountryId]        INT            NOT NULL,
    [Address_PostCode] INT            NULL,
    [CreatedAt]        DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    [CreatedById]      INT            NOT NULL,
    [UpdatedAt]        DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [UpdatedBy]        INT            NULL,
    CONSTRAINT [PK_RegisteredCompanyPlaintiffs] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_RegisteredCompanyPlaintiffs_Cities_City] FOREIGN KEY ([City]) REFERENCES [LK].[Cities] ([Id]),
    CONSTRAINT [FK_RegisteredCompanyPlaintiffs_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [LK].[Countries] ([Id]),
    CONSTRAINT [FK_RegisteredCompanyPlaintiffs_GuidanceRequests_RequestId] FOREIGN KEY ([RequestId]) REFERENCES [SECR].[GuidanceRequests] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_RegisteredCompanyPlaintiffs_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_RegisteredCompanyPlaintiffs_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_RegisteredCompanyPlaintiffs_UpdatedBy]
    ON [GUDR].[RegisteredCompanyPlaintiffs]([UpdatedBy] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_RegisteredCompanyPlaintiffs_RequestId]
    ON [GUDR].[RegisteredCompanyPlaintiffs]([RequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RegisteredCompanyPlaintiffs_CreatedById]
    ON [GUDR].[RegisteredCompanyPlaintiffs]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RegisteredCompanyPlaintiffs_CountryId]
    ON [GUDR].[RegisteredCompanyPlaintiffs]([CountryId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RegisteredCompanyPlaintiffs_City]
    ON [GUDR].[RegisteredCompanyPlaintiffs]([City] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Guidance Registered Company Plaintiff', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'RegisteredCompanyPlaintiffs', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Guidance Registered Company Plaintiff', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'RegisteredCompanyPlaintiffs', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Guidance Registered Company Plaintiff', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'RegisteredCompanyPlaintiffs', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Guidance Registered Company Plaintiff', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'RegisteredCompanyPlaintiffs', @level2type = N'COLUMN', @level2name = N'CreatedAt';

