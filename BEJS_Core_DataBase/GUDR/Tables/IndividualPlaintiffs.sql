CREATE TABLE [GUDR].[IndividualPlaintiffs] (
    [Id]                                INT              IDENTITY (1, 1) NOT NULL,
    [RequestId]                         INT              NOT NULL,
    [CityId]                            INT              NOT NULL,
    [CountryId]                         INT              NOT NULL,
    [Address_PostCode]                  INT              NULL,
    [NationalID]                        BIGINT           NULL,
    [IqamaNumber]                       BIGINT           NULL,
    [BorderNumber]                      BIGINT           NULL,
    [GulfNumber]                        BIGINT           NULL,
    [PassportNumber]                    NVARCHAR (30)    NULL,
    [VisaNumber]                        NVARCHAR (15)    NULL,
    [FirstName]                         NVARCHAR (50)    NULL,
    [FatherName]                        NVARCHAR (50)    NULL,
    [GrandfatherName]                   NVARCHAR (50)    NULL,
    [FamilyName]                        NVARCHAR (50)    NULL,
    [AbsherTransactionId]               UNIQUEIDENTIFIER NULL,
    [AbsherNationalityCode]             INT              NULL,
    [AbsherNationalityDescription]      NVARCHAR (100)   NULL,
    [VisitorOrGulfFullName]             NVARCHAR (250)   NULL,
    [VisitorOrGulfNationalityId]        INT              NULL,
    [IdentityTypeCode]                  SMALLINT         NOT NULL,
    [BirthDate]                         DATE             NULL,
    [BirthDateHijri]                    DECIMAL (8)      NULL,
    [Mobile]                            NVARCHAR (12)    NOT NULL,
    [Email]                             NVARCHAR (50)    NOT NULL,
    [CreatedAt]                         DATETIME2 (7)    DEFAULT (getdate()) NOT NULL,
    [CreatedById]                       INT              NOT NULL,
    [UpdatedAt]                         DATETIME2 (7)    DEFAULT (getdate()) NULL,
    [UpdatedBy]                         INT              NULL,
    [GuidanceIndividualPlaintiff_Email] NVARCHAR (50)    DEFAULT (N'') NOT NULL,
    [Phone]                             NVARCHAR (50)    DEFAULT (N'') NOT NULL,
    CONSTRAINT [PK_IndividualPlaintiffs] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_IndividualPlaintiffs_AbsherTransactionData_AbsherTransactionId] FOREIGN KEY ([AbsherTransactionId]) REFERENCES [INTG].[AbsherTransactionData] ([Id]),
    CONSTRAINT [FK_IndividualPlaintiffs_Cities_CityId] FOREIGN KEY ([CityId]) REFERENCES [LK].[Cities] ([Id]),
    CONSTRAINT [FK_IndividualPlaintiffs_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [LK].[Countries] ([Id]),
    CONSTRAINT [FK_IndividualPlaintiffs_Countries_VisitorOrGulfNationalityId] FOREIGN KEY ([VisitorOrGulfNationalityId]) REFERENCES [LK].[Countries] ([Id]),
    CONSTRAINT [FK_IndividualPlaintiffs_GuidanceRequests_RequestId] FOREIGN KEY ([RequestId]) REFERENCES [SECR].[GuidanceRequests] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_IndividualPlaintiffs_PersonIdentityTypes_IdentityTypeCode] FOREIGN KEY ([IdentityTypeCode]) REFERENCES [ExrLK].[PersonIdentityTypes] ([Code]),
    CONSTRAINT [FK_IndividualPlaintiffs_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_IndividualPlaintiffs_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_IndividualPlaintiffs_VisitorOrGulfNationalityId]
    ON [GUDR].[IndividualPlaintiffs]([VisitorOrGulfNationalityId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_IndividualPlaintiffs_UpdatedBy]
    ON [GUDR].[IndividualPlaintiffs]([UpdatedBy] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_IndividualPlaintiffs_RequestId]
    ON [GUDR].[IndividualPlaintiffs]([RequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_IndividualPlaintiffs_IdentityTypeCode]
    ON [GUDR].[IndividualPlaintiffs]([IdentityTypeCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_IndividualPlaintiffs_CreatedById]
    ON [GUDR].[IndividualPlaintiffs]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_IndividualPlaintiffs_CountryId]
    ON [GUDR].[IndividualPlaintiffs]([CountryId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_IndividualPlaintiffs_CityId]
    ON [GUDR].[IndividualPlaintiffs]([CityId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_IndividualPlaintiffs_AbsherTransactionId]
    ON [GUDR].[IndividualPlaintiffs]([AbsherTransactionId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Guidance Individual Plaintiff', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'IndividualPlaintiffs', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Guidance Individual Plaintiff', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'IndividualPlaintiffs', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Guidance Individual Plaintiff', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'IndividualPlaintiffs', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Guidance Individual Plaintiff', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'IndividualPlaintiffs', @level2type = N'COLUMN', @level2name = N'CreatedAt';

