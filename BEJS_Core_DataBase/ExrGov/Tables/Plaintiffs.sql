CREATE TABLE [ExrGov].[Plaintiffs] (
    [Id]               INT            IDENTITY (1, 1) NOT NULL,
    [RequestId]        INT            NOT NULL,
    [AgencyId]         INT            NOT NULL,
    [Phone]            NVARCHAR (100) NOT NULL,
    [Email]            NVARCHAR (200) NOT NULL,
    [BuildingNumber]   SMALLINT       NULL,
    [AdditionalNumber] SMALLINT       NULL,
    [CountryId]        INT            NULL,
    [PostCode]         INT            NULL,
    [CityId]           INT            NULL,
    [District]         NVARCHAR (50)  NULL,
    [Street]           NVARCHAR (50)  NULL,
    [CreatedAt]        DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    [CreatedById]      INT            NOT NULL,
    [UpdatedAt]        DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [UpdatedBy]        INT            NULL,
    CONSTRAINT [PK_Plaintiffs] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Plaintiffs_Agencies_AgencyId] FOREIGN KEY ([AgencyId]) REFERENCES [GOV].[Agencies] ([Id]),
    CONSTRAINT [FK_Plaintiffs_Cities_CityId] FOREIGN KEY ([CityId]) REFERENCES [LK].[Cities] ([Id]),
    CONSTRAINT [FK_Plaintiffs_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [LK].[Countries] ([Id]),
    CONSTRAINT [FK_Plaintiffs_Requests_RequestId] FOREIGN KEY ([RequestId]) REFERENCES [ExrGov].[Requests] ([Id]),
    CONSTRAINT [FK_Plaintiffs_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_Plaintiffs_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Plaintiffs_UpdatedBy]
    ON [ExrGov].[Plaintiffs]([UpdatedBy] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Plaintiffs_RequestId]
    ON [ExrGov].[Plaintiffs]([RequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Plaintiffs_CreatedById]
    ON [ExrGov].[Plaintiffs]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Plaintiffs_CountryId]
    ON [ExrGov].[Plaintiffs]([CountryId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Plaintiffs_CityId]
    ON [ExrGov].[Plaintiffs]([CityId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Plaintiffs_AgencyId]
    ON [ExrGov].[Plaintiffs]([AgencyId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Gov Agency Plaintiff', @level0type = N'SCHEMA', @level0name = N'ExrGov', @level1type = N'TABLE', @level1name = N'Plaintiffs', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Gov Agency Plaintiff', @level0type = N'SCHEMA', @level0name = N'ExrGov', @level1type = N'TABLE', @level1name = N'Plaintiffs', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Gov Agency Plaintiff', @level0type = N'SCHEMA', @level0name = N'ExrGov', @level1type = N'TABLE', @level1name = N'Plaintiffs', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Gov Agency Plaintiff', @level0type = N'SCHEMA', @level0name = N'ExrGov', @level1type = N'TABLE', @level1name = N'Plaintiffs', @level2type = N'COLUMN', @level2name = N'CreatedAt';

