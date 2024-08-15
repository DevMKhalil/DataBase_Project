CREATE TABLE [GUDR].[WaqfPlaintiffs] (
    [Id]                 INT            IDENTITY (1, 1) NOT NULL,
    [RequestId]          INT            NOT NULL,
    [City]               INT            NOT NULL,
    [CountryId]          INT            NOT NULL,
    [Address_PostCode]   INT            NULL,
    [CreatedAt]          DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    [CreatedById]        INT            NOT NULL,
    [UpdatedAt]          DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [UpdatedBy]          INT            NULL,
    [Name]               NVARCHAR (100) NOT NULL,
    [RegistrationNumber] NVARCHAR (50)  NOT NULL,
    [DeedNumber]         NVARCHAR (50)  NULL,
    [DeedDate]           DATE           NULL,
    [DeedDateHijri]      DECIMAL (8)    NULL,
    [MobileNumber]       NVARCHAR (12)  NOT NULL,
    [Email]              NVARCHAR (50)  NOT NULL,
    [UnifiedNumber]      BIGINT         DEFAULT (CONVERT([bigint],(0))) NOT NULL,
    CONSTRAINT [PK_WaqfPlaintiffs] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_WaqfPlaintiffs_Cities_City] FOREIGN KEY ([City]) REFERENCES [LK].[Cities] ([Id]),
    CONSTRAINT [FK_WaqfPlaintiffs_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [LK].[Countries] ([Id]),
    CONSTRAINT [FK_WaqfPlaintiffs_GuidanceRequests_RequestId] FOREIGN KEY ([RequestId]) REFERENCES [SECR].[GuidanceRequests] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_WaqfPlaintiffs_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_WaqfPlaintiffs_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_WaqfPlaintiffs_UpdatedBy]
    ON [GUDR].[WaqfPlaintiffs]([UpdatedBy] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_WaqfPlaintiffs_RequestId]
    ON [GUDR].[WaqfPlaintiffs]([RequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_WaqfPlaintiffs_CreatedById]
    ON [GUDR].[WaqfPlaintiffs]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_WaqfPlaintiffs_CountryId]
    ON [GUDR].[WaqfPlaintiffs]([CountryId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_WaqfPlaintiffs_City]
    ON [GUDR].[WaqfPlaintiffs]([City] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Guidance Waqf Plaintiff', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'WaqfPlaintiffs', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Guidance Waqf Plaintiff', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'WaqfPlaintiffs', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Guidance Waqf Plaintiff', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'WaqfPlaintiffs', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Guidance Waqf Plaintiff', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'WaqfPlaintiffs', @level2type = N'COLUMN', @level2name = N'CreatedAt';

