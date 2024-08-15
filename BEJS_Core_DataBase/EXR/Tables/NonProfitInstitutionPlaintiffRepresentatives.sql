CREATE TABLE [EXR].[NonProfitInstitutionPlaintiffRepresentatives] (
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
    [Person_IdNumber]                     BIGINT           NOT NULL,
    [Person_AbsherTransactionId]          UNIQUEIDENTIFIER NOT NULL,
    [Person_FirstName]                    NVARCHAR (50)    NOT NULL,
    [Person_FatherName]                   NVARCHAR (50)    NULL,
    [Person_GrandfatherName]              NVARCHAR (50)    NULL,
    [Person_FamilyName]                   NVARCHAR (50)    NOT NULL,
    [Person_AbsherNationalityCode]        INT              NULL,
    [Person_AbsherNationalityDescription] NVARCHAR (100)   NULL,
    [Person_IdentityTypeCode]             SMALLINT         NOT NULL,
    [Person_BirthDate]                    DATE             NULL,
    [Person_BirthDateHijri]               DECIMAL (8)      NULL,
    [Person_Mobile]                       NVARCHAR (12)    NOT NULL,
    [Person_Email]                        NVARCHAR (50)    NOT NULL,
    CONSTRAINT [PK_NonProfitInstitutionPlaintiffRepresentatives] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_NonProfitInstitutionPlaintiffRepresentatives_AbsherTransactionData_Person_AbsherTransactionId] FOREIGN KEY ([Person_AbsherTransactionId]) REFERENCES [INTG].[AbsherTransactionData] ([Id]),
    CONSTRAINT [FK_NonProfitInstitutionPlaintiffRepresentatives_Attachments_AgencyDeedDocumentId] FOREIGN KEY ([AgencyDeedDocumentId]) REFERENCES [ATTACH].[Attachments] ([Id]),
    CONSTRAINT [FK_NonProfitInstitutionPlaintiffRepresentatives_PersonIdentityTypes_Person_IdentityTypeCode] FOREIGN KEY ([Person_IdentityTypeCode]) REFERENCES [ExrLK].[PersonIdentityTypes] ([Code]),
    CONSTRAINT [FK_NonProfitInstitutionPlaintiffRepresentatives_PlaintiffRepresentativeTypes_TypeId] FOREIGN KEY ([TypeId]) REFERENCES [ExrLK].[PlaintiffRepresentativeTypes] ([Id]),
    CONSTRAINT [FK_NonProfitInstitutionPlaintiffRepresentatives_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_NonProfitInstitutionPlaintiffRepresentatives_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_NonProfitInstitutionPlaintiffRepresentatives_UpdatedBy]
    ON [EXR].[NonProfitInstitutionPlaintiffRepresentatives]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_NonProfitInstitutionPlaintiffRepresentatives_TypeId]
    ON [EXR].[NonProfitInstitutionPlaintiffRepresentatives]([TypeId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_NonProfitInstitutionPlaintiffRepresentatives_Person_IdentityTypeCode]
    ON [EXR].[NonProfitInstitutionPlaintiffRepresentatives]([Person_IdentityTypeCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_NonProfitInstitutionPlaintiffRepresentatives_Person_AbsherTransactionId]
    ON [EXR].[NonProfitInstitutionPlaintiffRepresentatives]([Person_AbsherTransactionId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_NonProfitInstitutionPlaintiffRepresentatives_CreatedById]
    ON [EXR].[NonProfitInstitutionPlaintiffRepresentatives]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_NonProfitInstitutionPlaintiffRepresentatives_AgencyDeedDocumentId]
    ON [EXR].[NonProfitInstitutionPlaintiffRepresentatives]([AgencyDeedDocumentId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Non Profit Institution Plaintiff Representative', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'NonProfitInstitutionPlaintiffRepresentatives', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Non Profit Institution Plaintiff Representative', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'NonProfitInstitutionPlaintiffRepresentatives', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Non Profit Institution Plaintiff Representative', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'NonProfitInstitutionPlaintiffRepresentatives', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Non Profit Institution Plaintiff Representative', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'NonProfitInstitutionPlaintiffRepresentatives', @level2type = N'COLUMN', @level2name = N'CreatedAt';

