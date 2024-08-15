CREATE TABLE [EXR].[WaqPlaintiffRepresentatives] (
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
    CONSTRAINT [PK_WaqPlaintiffRepresentatives] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_WaqPlaintiffRepresentatives_AbsherTransactionData_Person_AbsherTransactionId] FOREIGN KEY ([Person_AbsherTransactionId]) REFERENCES [INTG].[AbsherTransactionData] ([Id]),
    CONSTRAINT [FK_WaqPlaintiffRepresentatives_Attachments_AgencyDeedDocumentId] FOREIGN KEY ([AgencyDeedDocumentId]) REFERENCES [ATTACH].[Attachments] ([Id]),
    CONSTRAINT [FK_WaqPlaintiffRepresentatives_PersonIdentityTypes_Person_IdentityTypeCode] FOREIGN KEY ([Person_IdentityTypeCode]) REFERENCES [ExrLK].[PersonIdentityTypes] ([Code]),
    CONSTRAINT [FK_WaqPlaintiffRepresentatives_PlaintiffRepresentativeTypes_TypeId] FOREIGN KEY ([TypeId]) REFERENCES [ExrLK].[PlaintiffRepresentativeTypes] ([Id]),
    CONSTRAINT [FK_WaqPlaintiffRepresentatives_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_WaqPlaintiffRepresentatives_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_WaqPlaintiffRepresentatives_UpdatedBy]
    ON [EXR].[WaqPlaintiffRepresentatives]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_WaqPlaintiffRepresentatives_TypeId]
    ON [EXR].[WaqPlaintiffRepresentatives]([TypeId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_WaqPlaintiffRepresentatives_Person_IdentityTypeCode]
    ON [EXR].[WaqPlaintiffRepresentatives]([Person_IdentityTypeCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_WaqPlaintiffRepresentatives_Person_AbsherTransactionId]
    ON [EXR].[WaqPlaintiffRepresentatives]([Person_AbsherTransactionId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_WaqPlaintiffRepresentatives_CreatedById]
    ON [EXR].[WaqPlaintiffRepresentatives]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_WaqPlaintiffRepresentatives_AgencyDeedDocumentId]
    ON [EXR].[WaqPlaintiffRepresentatives]([AgencyDeedDocumentId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Waqf Plaintiff Representative', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'WaqPlaintiffRepresentatives', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Waqf Plaintiff Representative', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'WaqPlaintiffRepresentatives', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Waqf Plaintiff Representative', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'WaqPlaintiffRepresentatives', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Waqf Plaintiff Representative', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'WaqPlaintiffRepresentatives', @level2type = N'COLUMN', @level2name = N'CreatedAt';

