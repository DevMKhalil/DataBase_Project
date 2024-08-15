CREATE TABLE [EXR].[IndividualPlaintiffRepresentatives] (
    [Id]                                  INT              IDENTITY (1, 1) NOT NULL,
    [CreatedAt]                           DATETIME2 (7)    DEFAULT (getdate()) NOT NULL,
    [CreatedById]                         INT              NOT NULL,
    [UpdatedAt]                           DATETIME2 (7)    DEFAULT (getdate()) NULL,
    [UpdatedBy]                           INT              NULL,
    [TypeId]                              INT              NOT NULL,
    [AgencyDeedDate]                      DATE             NULL,
    [AgencyDeedDateHijri]                 DECIMAL (8)      NULL,
    [AgencyDeedNumber]                    BIGINT           NOT NULL,
    [AgencyDeedDocumentId]                BIGINT           NOT NULL,
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
    [Person_Mobile]                       NVARCHAR (12)    NOT NULL,
    [Person_Email]                        NVARCHAR (50)    NOT NULL,
    [Person_VisaNumber]                   NVARCHAR (15)    NULL,
    CONSTRAINT [PK_IndividualPlaintiffRepresentatives] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_IndividualPlaintiffRepresentatives_AbsherTransactionData_Person_AbsherTransactionId] FOREIGN KEY ([Person_AbsherTransactionId]) REFERENCES [INTG].[AbsherTransactionData] ([Id]),
    CONSTRAINT [FK_IndividualPlaintiffRepresentatives_Attachments_AgencyDeedDocumentId] FOREIGN KEY ([AgencyDeedDocumentId]) REFERENCES [ATTACH].[Attachments] ([Id]),
    CONSTRAINT [FK_IndividualPlaintiffRepresentatives_Countries_Person_VisitorOrGulfNationalityId] FOREIGN KEY ([Person_VisitorOrGulfNationalityId]) REFERENCES [LK].[Countries] ([Id]),
    CONSTRAINT [FK_IndividualPlaintiffRepresentatives_PersonIdentityTypes_Person_IdentityTypeCode] FOREIGN KEY ([Person_IdentityTypeCode]) REFERENCES [ExrLK].[PersonIdentityTypes] ([Code]),
    CONSTRAINT [FK_IndividualPlaintiffRepresentatives_PlaintiffRepresentativeTypes_TypeId] FOREIGN KEY ([TypeId]) REFERENCES [ExrLK].[PlaintiffRepresentativeTypes] ([Id]),
    CONSTRAINT [FK_IndividualPlaintiffRepresentatives_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_IndividualPlaintiffRepresentatives_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_IndividualPlaintiffRepresentatives_UpdatedBy]
    ON [EXR].[IndividualPlaintiffRepresentatives]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_IndividualPlaintiffRepresentatives_TypeId]
    ON [EXR].[IndividualPlaintiffRepresentatives]([TypeId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_IndividualPlaintiffRepresentatives_Person_VisitorOrGulfNationalityId]
    ON [EXR].[IndividualPlaintiffRepresentatives]([Person_VisitorOrGulfNationalityId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_IndividualPlaintiffRepresentatives_Person_IdentityTypeCode]
    ON [EXR].[IndividualPlaintiffRepresentatives]([Person_IdentityTypeCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_IndividualPlaintiffRepresentatives_Person_AbsherTransactionId]
    ON [EXR].[IndividualPlaintiffRepresentatives]([Person_AbsherTransactionId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_IndividualPlaintiffRepresentatives_CreatedById]
    ON [EXR].[IndividualPlaintiffRepresentatives]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_IndividualPlaintiffRepresentatives_AgencyDeedDocumentId]
    ON [EXR].[IndividualPlaintiffRepresentatives]([AgencyDeedDocumentId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Individual Plaintiff Representative', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'IndividualPlaintiffRepresentatives', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Individual Plaintiff Representative', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'IndividualPlaintiffRepresentatives', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Individual Plaintiff Representative', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'IndividualPlaintiffRepresentatives', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Individual Plaintiff Representative', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'IndividualPlaintiffRepresentatives', @level2type = N'COLUMN', @level2name = N'CreatedAt';

