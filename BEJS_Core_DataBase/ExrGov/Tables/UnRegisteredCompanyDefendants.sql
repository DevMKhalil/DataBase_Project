CREATE TABLE [ExrGov].[UnRegisteredCompanyDefendants] (
    [Id]                                          INT              IDENTITY (1, 1) NOT NULL,
    [RequestId]                                   INT              NOT NULL,
    [City]                                        NVARCHAR (50)    NOT NULL,
    [CountryId]                                   INT              NOT NULL,
    [District]                                    NVARCHAR (50)    NULL,
    [Street]                                      NVARCHAR (50)    NULL,
    [BuildingNumber]                              SMALLINT         NULL,
    [PostCode]                                    INT              NULL,
    [AdditionalNumber]                            SMALLINT         NULL,
    [ExtraInformation]                            NVARCHAR (3000)  NULL,
    [Representative_NationalID]                   BIGINT           NULL,
    [Representative_IqamaNumber]                  BIGINT           NULL,
    [Representative_BorderNumber]                 BIGINT           NULL,
    [Representative_GulfNumber]                   BIGINT           NULL,
    [Representative_PassportNumber]               NVARCHAR (30)    NULL,
    [Representative_FirstName]                    NVARCHAR (50)    NULL,
    [Representative_FatherName]                   NVARCHAR (50)    NULL,
    [Representative_GrandfatherName]              NVARCHAR (50)    NULL,
    [Representative_FamilyName]                   NVARCHAR (50)    NULL,
    [Representative_AbsherTransactionId]          UNIQUEIDENTIFIER NULL,
    [Representative_AbsherNationalityCode]        INT              NULL,
    [Representative_AbsherNationalityDescription] NVARCHAR (100)   NULL,
    [Representative_VisitorOrGulfFullName]        NVARCHAR (250)   NULL,
    [Representative_VisitorOrGulfNationalityId]   INT              NULL,
    [Representative_IdentityTypeCode]             SMALLINT         NOT NULL,
    [Representative_BirthDate]                    DATE             NULL,
    [Representative_BirthDateHijri]               DECIMAL (8)      NULL,
    [Representative_Mobile]                       NVARCHAR (12)    NULL,
    [Representative_Email]                        NVARCHAR (50)    NULL,
    [CreatedAt]                                   DATETIME2 (7)    DEFAULT (getdate()) NOT NULL,
    [CreatedById]                                 INT              NOT NULL,
    [UpdatedAt]                                   DATETIME2 (7)    DEFAULT (getdate()) NULL,
    [UpdatedBy]                                   INT              NULL,
    [Name]                                        NVARCHAR (100)   NOT NULL,
    [MISALicenseNo]                               BIGINT           NULL,
    [CRNumber]                                    NVARCHAR (50)    NULL,
    [CRStartDate]                                 DATE             NULL,
    [CRStartDateHijri]                            DECIMAL (8)      NULL,
    [CREndDate]                                   DATE             NULL,
    [CREndDateHijri]                              DECIMAL (8)      NULL,
    [Representative_VisaNumber]                   NVARCHAR (15)    NULL,
    [Email]                                       NVARCHAR (50)    NULL,
    [Phone]                                       NVARCHAR (50)    NULL,
    CONSTRAINT [PK_UnRegisteredCompanyDefendants] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_UnRegisteredCompanyDefendants_AbsherTransactionData_Representative_AbsherTransactionId] FOREIGN KEY ([Representative_AbsherTransactionId]) REFERENCES [INTG].[AbsherTransactionData] ([Id]),
    CONSTRAINT [FK_UnRegisteredCompanyDefendants_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [LK].[Countries] ([Id]),
    CONSTRAINT [FK_UnRegisteredCompanyDefendants_Countries_Representative_VisitorOrGulfNationalityId] FOREIGN KEY ([Representative_VisitorOrGulfNationalityId]) REFERENCES [LK].[Countries] ([Id]),
    CONSTRAINT [FK_UnRegisteredCompanyDefendants_PersonIdentityTypes_Representative_IdentityTypeCode] FOREIGN KEY ([Representative_IdentityTypeCode]) REFERENCES [ExrLK].[PersonIdentityTypes] ([Code]),
    CONSTRAINT [FK_UnRegisteredCompanyDefendants_Requests_RequestId] FOREIGN KEY ([RequestId]) REFERENCES [ExrGov].[Requests] ([Id]),
    CONSTRAINT [FK_UnRegisteredCompanyDefendants_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_UnRegisteredCompanyDefendants_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [AK_UnRegisteredCompanyDefendants_RequestId_Id] UNIQUE NONCLUSTERED ([RequestId] ASC, [Id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_UnRegisteredCompanyDefendants_UpdatedBy]
    ON [ExrGov].[UnRegisteredCompanyDefendants]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_UnRegisteredCompanyDefendants_Representative_VisitorOrGulfNationalityId]
    ON [ExrGov].[UnRegisteredCompanyDefendants]([Representative_VisitorOrGulfNationalityId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_UnRegisteredCompanyDefendants_Representative_IdentityTypeCode]
    ON [ExrGov].[UnRegisteredCompanyDefendants]([Representative_IdentityTypeCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_UnRegisteredCompanyDefendants_Representative_AbsherTransactionId]
    ON [ExrGov].[UnRegisteredCompanyDefendants]([Representative_AbsherTransactionId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_UnRegisteredCompanyDefendants_CreatedById]
    ON [ExrGov].[UnRegisteredCompanyDefendants]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_UnRegisteredCompanyDefendants_CountryId]
    ON [ExrGov].[UnRegisteredCompanyDefendants]([CountryId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Un Registered Company Defendant', @level0type = N'SCHEMA', @level0name = N'ExrGov', @level1type = N'TABLE', @level1name = N'UnRegisteredCompanyDefendants', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Un Registered Company Defendant', @level0type = N'SCHEMA', @level0name = N'ExrGov', @level1type = N'TABLE', @level1name = N'UnRegisteredCompanyDefendants', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Un Registered Company Defendant', @level0type = N'SCHEMA', @level0name = N'ExrGov', @level1type = N'TABLE', @level1name = N'UnRegisteredCompanyDefendants', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Un Registered Company Defendant', @level0type = N'SCHEMA', @level0name = N'ExrGov', @level1type = N'TABLE', @level1name = N'UnRegisteredCompanyDefendants', @level2type = N'COLUMN', @level2name = N'CreatedAt';

