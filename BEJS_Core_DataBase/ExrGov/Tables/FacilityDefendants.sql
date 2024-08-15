CREATE TABLE [ExrGov].[FacilityDefendants] (
    [Id]                    INT             IDENTITY (1, 1) NOT NULL,
    [CityId]                INT             NULL,
    [CountryId]             INT             NOT NULL,
    [District]              NVARCHAR (50)   NULL,
    [Street]                NVARCHAR (50)   NULL,
    [BuildingNumber]        SMALLINT        NULL,
    [PostCode]              INT             NULL,
    [AdditionalNumber]      SMALLINT        NULL,
    [ExtraInformation]      NVARCHAR (3000) NULL,
    [CreatedAt]             DATETIME2 (7)   DEFAULT (getdate()) NOT NULL,
    [CreatedById]           INT             NOT NULL,
    [UpdatedAt]             DATETIME2 (7)   DEFAULT (getdate()) NULL,
    [UpdatedBy]             INT             NULL,
    [Name]                  NVARCHAR (100)  NOT NULL,
    [CRNumber]              BIGINT          NULL,
    [CRStartDate]           DATE            NULL,
    [CRStartDateHijri]      DECIMAL (8)     NULL,
    [CREndDate]             DATE            NULL,
    [CREndDateHijri]        DECIMAL (8)     NULL,
    [NationalUnifiedNumber] BIGINT          NULL,
    [Phone]                 NVARCHAR (12)   NULL,
    [Email]                 NVARCHAR (50)   NULL,
    [RequestId]             INT             DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_FacilityDefendants] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_FacilityDefendants_Cities_CityId] FOREIGN KEY ([CityId]) REFERENCES [LK].[Cities] ([Id]),
    CONSTRAINT [FK_FacilityDefendants_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [LK].[Countries] ([Id]),
    CONSTRAINT [FK_FacilityDefendants_Requests_RequestId] FOREIGN KEY ([RequestId]) REFERENCES [ExrGov].[Requests] ([Id]),
    CONSTRAINT [FK_FacilityDefendants_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_FacilityDefendants_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [AK_FacilityDefendants_RequestId_Id] UNIQUE NONCLUSTERED ([RequestId] ASC, [Id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_FacilityDefendants_UpdatedBy]
    ON [ExrGov].[FacilityDefendants]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FacilityDefendants_CreatedById]
    ON [ExrGov].[FacilityDefendants]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FacilityDefendants_CountryId]
    ON [ExrGov].[FacilityDefendants]([CountryId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FacilityDefendants_CityId]
    ON [ExrGov].[FacilityDefendants]([CityId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Facility Defendant', @level0type = N'SCHEMA', @level0name = N'ExrGov', @level1type = N'TABLE', @level1name = N'FacilityDefendants', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Facility Defendant', @level0type = N'SCHEMA', @level0name = N'ExrGov', @level1type = N'TABLE', @level1name = N'FacilityDefendants', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Facility Defendant', @level0type = N'SCHEMA', @level0name = N'ExrGov', @level1type = N'TABLE', @level1name = N'FacilityDefendants', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Facility Defendant', @level0type = N'SCHEMA', @level0name = N'ExrGov', @level1type = N'TABLE', @level1name = N'FacilityDefendants', @level2type = N'COLUMN', @level2name = N'CreatedAt';

