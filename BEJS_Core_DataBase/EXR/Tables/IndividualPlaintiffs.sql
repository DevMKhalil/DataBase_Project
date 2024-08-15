CREATE TABLE [EXR].[IndividualPlaintiffs] (
    [Id]                           INT              IDENTITY (1, 1) NOT NULL,
    [RequestId]                    INT              NOT NULL,
    [NationalID]                   BIGINT           NULL,
    [IqamaNumber]                  BIGINT           NULL,
    [BorderNumber]                 BIGINT           NULL,
    [GulfNumber]                   BIGINT           NULL,
    [PassportNumber]               NVARCHAR (30)    NULL,
    [FirstName]                    NVARCHAR (50)    NULL,
    [FatherName]                   NVARCHAR (50)    NULL,
    [GrandfatherName]              NVARCHAR (50)    NULL,
    [FamilyName]                   NVARCHAR (50)    NULL,
    [AbsherTransactionId]          UNIQUEIDENTIFIER NULL,
    [AbsherNationalityCode]        INT              NULL,
    [AbsherNationalityDescription] NVARCHAR (100)   NULL,
    [VisitorOrGulfFullName]        NVARCHAR (250)   NULL,
    [VisitorOrGulfNationalityId]   INT              NULL,
    [IdentityTypeCode]             SMALLINT         NOT NULL,
    [BirthDate]                    DATE             NULL,
    [BirthDateHijri]               DECIMAL (8)      NULL,
    [Mobile]                       NVARCHAR (12)    NOT NULL,
    [Email]                        NVARCHAR (50)    NOT NULL,
    [Address_BuildingNumber]       SMALLINT         NULL,
    [Address_AdditionalNumber]     SMALLINT         NULL,
    [Address_ExtraInformation]     NVARCHAR (3000)  NULL,
    [Address_CountryId]            INT              NOT NULL,
    [Address_PostCode]             INT              NOT NULL,
    [Address_CityId]               INT              NOT NULL,
    [Address_District]             NVARCHAR (50)    NOT NULL,
    [Address_Street]               NVARCHAR (50)    NOT NULL,
    [OnBehalfOfHimself]            BIT              NOT NULL,
    [CreatedAt]                    DATETIME2 (7)    DEFAULT (getdate()) NOT NULL,
    [CreatedById]                  INT              NOT NULL,
    [UpdatedAt]                    DATETIME2 (7)    DEFAULT (getdate()) NULL,
    [UpdatedBy]                    INT              NULL,
    [VisaNumber]                   NVARCHAR (15)    NULL,
    CONSTRAINT [PK_IndividualPlaintiffs] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_IndividualPlaintiffs_AbsherTransactionData_AbsherTransactionId] FOREIGN KEY ([AbsherTransactionId]) REFERENCES [INTG].[AbsherTransactionData] ([Id]),
    CONSTRAINT [FK_IndividualPlaintiffs_Cities_Address_CityId] FOREIGN KEY ([Address_CityId]) REFERENCES [LK].[Cities] ([Id]),
    CONSTRAINT [FK_IndividualPlaintiffs_Countries_Address_CountryId] FOREIGN KEY ([Address_CountryId]) REFERENCES [LK].[Countries] ([Id]),
    CONSTRAINT [FK_IndividualPlaintiffs_Countries_VisitorOrGulfNationalityId] FOREIGN KEY ([VisitorOrGulfNationalityId]) REFERENCES [LK].[Countries] ([Id]),
    CONSTRAINT [FK_IndividualPlaintiffs_IndividualRequests_RequestId] FOREIGN KEY ([RequestId]) REFERENCES [EXR].[IndividualRequests] ([Id]),
    CONSTRAINT [FK_IndividualPlaintiffs_PersonIdentityTypes_IdentityTypeCode] FOREIGN KEY ([IdentityTypeCode]) REFERENCES [ExrLK].[PersonIdentityTypes] ([Code]),
    CONSTRAINT [FK_IndividualPlaintiffs_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_IndividualPlaintiffs_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_IndividualPlaintiffs_VisitorOrGulfNationalityId]
    ON [EXR].[IndividualPlaintiffs]([VisitorOrGulfNationalityId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_IndividualPlaintiffs_UpdatedBy]
    ON [EXR].[IndividualPlaintiffs]([UpdatedBy] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_IndividualPlaintiffs_RequestId]
    ON [EXR].[IndividualPlaintiffs]([RequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_IndividualPlaintiffs_IdentityTypeCode]
    ON [EXR].[IndividualPlaintiffs]([IdentityTypeCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_IndividualPlaintiffs_CreatedById]
    ON [EXR].[IndividualPlaintiffs]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_IndividualPlaintiffs_Address_CountryId]
    ON [EXR].[IndividualPlaintiffs]([Address_CountryId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_IndividualPlaintiffs_Address_CityId]
    ON [EXR].[IndividualPlaintiffs]([Address_CityId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_IndividualPlaintiffs_AbsherTransactionId]
    ON [EXR].[IndividualPlaintiffs]([AbsherTransactionId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Individual Plaintiff', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'IndividualPlaintiffs', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Individual Plaintiff', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'IndividualPlaintiffs', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Individual Plaintiff', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'IndividualPlaintiffs', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Individual Plaintiff', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'IndividualPlaintiffs', @level2type = N'COLUMN', @level2name = N'CreatedAt';

