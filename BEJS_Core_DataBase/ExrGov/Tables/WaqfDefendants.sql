CREATE TABLE [ExrGov].[WaqfDefendants] (
    [Id]                 INT             IDENTITY (1, 1) NOT NULL,
    [RequestId]          INT             NOT NULL,
    [CityId]             INT             NOT NULL,
    [CountryId]          INT             NOT NULL,
    [District]           NVARCHAR (50)   NULL,
    [Street]             NVARCHAR (50)   NULL,
    [BuildingNumber]     SMALLINT        NULL,
    [PostCode]           INT             NULL,
    [AdditionalNumber]   SMALLINT        NULL,
    [ExtraInformation]   NVARCHAR (3000) NULL,
    [CreatedAt]          DATETIME2 (7)   DEFAULT (getdate()) NOT NULL,
    [CreatedById]        INT             NOT NULL,
    [UpdatedAt]          DATETIME2 (7)   DEFAULT (getdate()) NULL,
    [UpdatedBy]          INT             NULL,
    [Name]               NVARCHAR (100)  NOT NULL,
    [RegistrationNumber] NVARCHAR (50)   NULL,
    [DeedNumber]         NVARCHAR (50)   NULL,
    [DeedDate]           DATE            NULL,
    [DeedDateHijri]      DECIMAL (8)     NULL,
    [Email]              NVARCHAR (50)   NULL,
    [MobileNumber]       NVARCHAR (12)   NULL,
    [UnifiedNumber]      BIGINT          NULL,
    CONSTRAINT [PK_WaqfDefendants] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_WaqfDefendants_Cities_CityId] FOREIGN KEY ([CityId]) REFERENCES [LK].[Cities] ([Id]),
    CONSTRAINT [FK_WaqfDefendants_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [LK].[Countries] ([Id]),
    CONSTRAINT [FK_WaqfDefendants_Requests_RequestId] FOREIGN KEY ([RequestId]) REFERENCES [ExrGov].[Requests] ([Id]),
    CONSTRAINT [FK_WaqfDefendants_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_WaqfDefendants_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [AK_WaqfDefendants_RequestId_Id] UNIQUE NONCLUSTERED ([RequestId] ASC, [Id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_WaqfDefendants_UpdatedBy]
    ON [ExrGov].[WaqfDefendants]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_WaqfDefendants_CreatedById]
    ON [ExrGov].[WaqfDefendants]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_WaqfDefendants_CountryId]
    ON [ExrGov].[WaqfDefendants]([CountryId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_WaqfDefendants_CityId]
    ON [ExrGov].[WaqfDefendants]([CityId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Waqf Defendant', @level0type = N'SCHEMA', @level0name = N'ExrGov', @level1type = N'TABLE', @level1name = N'WaqfDefendants', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Waqf Defendant', @level0type = N'SCHEMA', @level0name = N'ExrGov', @level1type = N'TABLE', @level1name = N'WaqfDefendants', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Waqf Defendant', @level0type = N'SCHEMA', @level0name = N'ExrGov', @level1type = N'TABLE', @level1name = N'WaqfDefendants', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Waqf Defendant', @level0type = N'SCHEMA', @level0name = N'ExrGov', @level1type = N'TABLE', @level1name = N'WaqfDefendants', @level2type = N'COLUMN', @level2name = N'CreatedAt';

