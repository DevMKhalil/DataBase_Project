CREATE TABLE [EXR].[WaqPlaintiffs] (
    [Id]                 INT             IDENTITY (1, 1) NOT NULL,
    [RequestId]          INT             NOT NULL,
    [UnifiedNumber]      BIGINT          NULL,
    [MobileNumber]       NVARCHAR (12)   NOT NULL,
    [Email]              NVARCHAR (50)   NOT NULL,
    [BuildingNumber]     SMALLINT        NULL,
    [AdditionalNumber]   SMALLINT        NULL,
    [ExtraInformation]   NVARCHAR (3000) NULL,
    [CountryId]          INT             NOT NULL,
    [PostCode]           INT             NOT NULL,
    [CityId]             INT             NOT NULL,
    [District]           NVARCHAR (50)   NOT NULL,
    [Street]             NVARCHAR (50)   NOT NULL,
    [CreatedAt]          DATETIME2 (7)   DEFAULT (getdate()) NOT NULL,
    [CreatedById]        INT             NOT NULL,
    [UpdatedAt]          DATETIME2 (7)   DEFAULT (getdate()) NULL,
    [UpdatedBy]          INT             NULL,
    [Name]               NVARCHAR (100)  NOT NULL,
    [RegistrationNumber] NVARCHAR (50)   NOT NULL,
    [DeedNumber]         NVARCHAR (50)   NOT NULL,
    [DeedDate]           DATE            NOT NULL,
    [DeedDateHijri]      DECIMAL (8)     NULL,
    CONSTRAINT [PK_WaqPlaintiffs] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_WaqPlaintiffs_Cities_CityId] FOREIGN KEY ([CityId]) REFERENCES [LK].[Cities] ([Id]),
    CONSTRAINT [FK_WaqPlaintiffs_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [LK].[Countries] ([Id]),
    CONSTRAINT [FK_WaqPlaintiffs_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_WaqPlaintiffs_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_WaqPlaintiffs_WaqfRequests_RequestId] FOREIGN KEY ([RequestId]) REFERENCES [EXR].[WaqfRequests] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_WaqPlaintiffs_UpdatedBy]
    ON [EXR].[WaqPlaintiffs]([UpdatedBy] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_WaqPlaintiffs_RequestId]
    ON [EXR].[WaqPlaintiffs]([RequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_WaqPlaintiffs_CreatedById]
    ON [EXR].[WaqPlaintiffs]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_WaqPlaintiffs_CountryId]
    ON [EXR].[WaqPlaintiffs]([CountryId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_WaqPlaintiffs_CityId]
    ON [EXR].[WaqPlaintiffs]([CityId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Waqf Plaintiff', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'WaqPlaintiffs', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Waqf Plaintiff', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'WaqPlaintiffs', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Waqf Plaintiff', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'WaqPlaintiffs', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Waqf Plaintiff', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'WaqPlaintiffs', @level2type = N'COLUMN', @level2name = N'CreatedAt';

