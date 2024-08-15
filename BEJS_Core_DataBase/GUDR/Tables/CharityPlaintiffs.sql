CREATE TABLE [GUDR].[CharityPlaintiffs] (
    [Id]               INT            IDENTITY (1, 1) NOT NULL,
    [RequestId]        INT            NOT NULL,
    [LicenseNumber]    BIGINT         NOT NULL,
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
    CONSTRAINT [PK_CharityPlaintiffs] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_CharityPlaintiffs_Cities_CityId] FOREIGN KEY ([CityId]) REFERENCES [LK].[Cities] ([Id]),
    CONSTRAINT [FK_CharityPlaintiffs_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [LK].[Countries] ([Id]),
    CONSTRAINT [FK_CharityPlaintiffs_GuidanceRequests_RequestId] FOREIGN KEY ([RequestId]) REFERENCES [SECR].[GuidanceRequests] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_CharityPlaintiffs_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_CharityPlaintiffs_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_CharityPlaintiffs_UpdatedBy]
    ON [GUDR].[CharityPlaintiffs]([UpdatedBy] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_CharityPlaintiffs_RequestId]
    ON [GUDR].[CharityPlaintiffs]([RequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CharityPlaintiffs_CreatedById]
    ON [GUDR].[CharityPlaintiffs]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CharityPlaintiffs_CountryId]
    ON [GUDR].[CharityPlaintiffs]([CountryId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CharityPlaintiffs_CityId]
    ON [GUDR].[CharityPlaintiffs]([CityId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Guidance Charity Plaintiff', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'CharityPlaintiffs', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Guidance Charity Plaintiff', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'CharityPlaintiffs', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Guidance Charity Plaintiff', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'CharityPlaintiffs', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Guidance Charity Plaintiff', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'CharityPlaintiffs', @level2type = N'COLUMN', @level2name = N'CreatedAt';

