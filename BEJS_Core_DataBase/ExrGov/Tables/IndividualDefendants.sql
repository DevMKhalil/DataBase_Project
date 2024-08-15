CREATE TABLE [ExrGov].[IndividualDefendants] (
    [Id]                                  INT              IDENTITY (1, 1) NOT NULL,
    [RequestId]                           INT              NOT NULL,
    [Person_NationalID]                   BIGINT           NULL,
    [Person_IqamaNumber]                  BIGINT           NULL,
    [Person_BorderNumber]                 BIGINT           NULL,
    [Person_GulfNumber]                   BIGINT           NULL,
    [Person_PassportNumber]               NVARCHAR (30)    NULL,
    [Person_FirstName]                    NVARCHAR (50)    NULL,
    [Person_FatherName]                   NVARCHAR (50)    NULL,
    [Person_GrandfatherName]              NVARCHAR (50)    NULL,
    [Person_FamilyName]                   NVARCHAR (50)    NULL,
    [Person_AbsherTransactionId]          UNIQUEIDENTIFIER NULL,
    [Person_AbsherNationalityCode]        INT              NULL,
    [Person_AbsherNationalityDescription] NVARCHAR (100)   NULL,
    [Person_VisitorOrGulfFullName]        NVARCHAR (250)   NULL,
    [Person_VisitorOrGulfNationalityId]   INT              NULL,
    [Person_IdentityTypeCode]             SMALLINT         NOT NULL,
    [Person_BirthDate]                    DATE             NULL,
    [Person_BirthDateHijri]               DECIMAL (8)      NULL,
    [Person_Mobile]                       NVARCHAR (12)    NULL,
    [Person_Email]                        NVARCHAR (50)    NULL,
    [Address_CityId]                      INT              NULL,
    [Address_CountryId]                   INT              NOT NULL,
    [Address_District]                    NVARCHAR (50)    NULL,
    [Address_Street]                      NVARCHAR (50)    NULL,
    [Address_BuildingNumber]              SMALLINT         NULL,
    [Address_PostCode]                    INT              NULL,
    [Address_AdditionalNumber]            SMALLINT         NULL,
    [Address_ExtraInformation]            NVARCHAR (3000)  NULL,
    [CreatedAt]                           DATETIME2 (7)    DEFAULT (getdate()) NOT NULL,
    [CreatedById]                         INT              NOT NULL,
    [UpdatedAt]                           DATETIME2 (7)    DEFAULT (getdate()) NULL,
    [UpdatedBy]                           INT              NULL,
    [Person_VisaNumber]                   NVARCHAR (15)    NULL,
    CONSTRAINT [PK_IndividualDefendants] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_IndividualDefendants_AbsherTransactionData_Person_AbsherTransactionId] FOREIGN KEY ([Person_AbsherTransactionId]) REFERENCES [INTG].[AbsherTransactionData] ([Id]),
    CONSTRAINT [FK_IndividualDefendants_Cities_Address_CityId] FOREIGN KEY ([Address_CityId]) REFERENCES [LK].[Cities] ([Id]),
    CONSTRAINT [FK_IndividualDefendants_Countries_Address_CountryId] FOREIGN KEY ([Address_CountryId]) REFERENCES [LK].[Countries] ([Id]),
    CONSTRAINT [FK_IndividualDefendants_Countries_Person_VisitorOrGulfNationalityId] FOREIGN KEY ([Person_VisitorOrGulfNationalityId]) REFERENCES [LK].[Countries] ([Id]),
    CONSTRAINT [FK_IndividualDefendants_PersonIdentityTypes_Person_IdentityTypeCode] FOREIGN KEY ([Person_IdentityTypeCode]) REFERENCES [ExrLK].[PersonIdentityTypes] ([Code]),
    CONSTRAINT [FK_IndividualDefendants_Requests_RequestId] FOREIGN KEY ([RequestId]) REFERENCES [ExrGov].[Requests] ([Id]),
    CONSTRAINT [FK_IndividualDefendants_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_IndividualDefendants_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [AK_IndividualDefendants_RequestId_Id] UNIQUE NONCLUSTERED ([RequestId] ASC, [Id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_IndividualDefendants_UpdatedBy]
    ON [ExrGov].[IndividualDefendants]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_IndividualDefendants_Person_VisitorOrGulfNationalityId]
    ON [ExrGov].[IndividualDefendants]([Person_VisitorOrGulfNationalityId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_IndividualDefendants_Person_IdentityTypeCode]
    ON [ExrGov].[IndividualDefendants]([Person_IdentityTypeCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_IndividualDefendants_Person_AbsherTransactionId]
    ON [ExrGov].[IndividualDefendants]([Person_AbsherTransactionId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_IndividualDefendants_CreatedById]
    ON [ExrGov].[IndividualDefendants]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_IndividualDefendants_Address_CountryId]
    ON [ExrGov].[IndividualDefendants]([Address_CountryId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_IndividualDefendants_Address_CityId]
    ON [ExrGov].[IndividualDefendants]([Address_CityId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Individual Defendant', @level0type = N'SCHEMA', @level0name = N'ExrGov', @level1type = N'TABLE', @level1name = N'IndividualDefendants', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Individual Defendant', @level0type = N'SCHEMA', @level0name = N'ExrGov', @level1type = N'TABLE', @level1name = N'IndividualDefendants', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Individual Defendant', @level0type = N'SCHEMA', @level0name = N'ExrGov', @level1type = N'TABLE', @level1name = N'IndividualDefendants', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Individual Defendant', @level0type = N'SCHEMA', @level0name = N'ExrGov', @level1type = N'TABLE', @level1name = N'IndividualDefendants', @level2type = N'COLUMN', @level2name = N'CreatedAt';

