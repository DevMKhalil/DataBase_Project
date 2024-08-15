CREATE TABLE [GUDR].[UnRegisteredCompanyPlaintiffRepresentatives] (
    [Id]                           INT              IDENTITY (1, 1) NOT NULL,
    [PlanttifId]                   INT              NOT NULL,
    [NationalID]                   BIGINT           NULL,
    [IqamaNumber]                  BIGINT           NULL,
    [BorderNumber]                 BIGINT           NULL,
    [GulfNumber]                   BIGINT           NULL,
    [PassportNumber]               NVARCHAR (30)    NULL,
    [VisaNumber]                   NVARCHAR (15)    NULL,
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
    [CreatedAt]                    DATETIME2 (7)    DEFAULT (getdate()) NOT NULL,
    [CreatedById]                  INT              NOT NULL,
    [UpdatedAt]                    DATETIME2 (7)    DEFAULT (getdate()) NULL,
    [UpdatedBy]                    INT              NULL,
    CONSTRAINT [PK_UnRegisteredCompanyPlaintiffRepresentatives] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_UnRegisteredCompanyPlaintiffRepresentatives_AbsherTransactionData_AbsherTransactionId] FOREIGN KEY ([AbsherTransactionId]) REFERENCES [INTG].[AbsherTransactionData] ([Id]),
    CONSTRAINT [FK_UnRegisteredCompanyPlaintiffRepresentatives_Countries_VisitorOrGulfNationalityId] FOREIGN KEY ([VisitorOrGulfNationalityId]) REFERENCES [LK].[Countries] ([Id]),
    CONSTRAINT [FK_UnRegisteredCompanyPlaintiffRepresentatives_PersonIdentityTypes_IdentityTypeCode] FOREIGN KEY ([IdentityTypeCode]) REFERENCES [ExrLK].[PersonIdentityTypes] ([Code]),
    CONSTRAINT [FK_UnRegisteredCompanyPlaintiffRepresentatives_UnregisteredCompanyPlaintiffs_PlanttifId] FOREIGN KEY ([PlanttifId]) REFERENCES [GUDR].[UnregisteredCompanyPlaintiffs] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_UnRegisteredCompanyPlaintiffRepresentatives_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_UnRegisteredCompanyPlaintiffRepresentatives_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_UnRegisteredCompanyPlaintiffRepresentatives_VisitorOrGulfNationalityId]
    ON [GUDR].[UnRegisteredCompanyPlaintiffRepresentatives]([VisitorOrGulfNationalityId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_UnRegisteredCompanyPlaintiffRepresentatives_UpdatedBy]
    ON [GUDR].[UnRegisteredCompanyPlaintiffRepresentatives]([UpdatedBy] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_UnRegisteredCompanyPlaintiffRepresentatives_PlanttifId]
    ON [GUDR].[UnRegisteredCompanyPlaintiffRepresentatives]([PlanttifId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_UnRegisteredCompanyPlaintiffRepresentatives_IdentityTypeCode]
    ON [GUDR].[UnRegisteredCompanyPlaintiffRepresentatives]([IdentityTypeCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_UnRegisteredCompanyPlaintiffRepresentatives_CreatedById]
    ON [GUDR].[UnRegisteredCompanyPlaintiffRepresentatives]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_UnRegisteredCompanyPlaintiffRepresentatives_AbsherTransactionId]
    ON [GUDR].[UnRegisteredCompanyPlaintiffRepresentatives]([AbsherTransactionId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Guidance Un Registered Company Plaintiff Representative', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'UnRegisteredCompanyPlaintiffRepresentatives', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Guidance Un Registered Company Plaintiff Representative', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'UnRegisteredCompanyPlaintiffRepresentatives', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Guidance Un Registered Company Plaintiff Representative', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'UnRegisteredCompanyPlaintiffRepresentatives', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Guidance Un Registered Company Plaintiff Representative', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'UnRegisteredCompanyPlaintiffRepresentatives', @level2type = N'COLUMN', @level2name = N'CreatedAt';

