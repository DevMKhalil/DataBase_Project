CREATE TABLE [EXR].[Enforcements] (
    [Id]                              INT             IDENTITY (1, 1) NOT NULL,
    [ExecutionRequestId]              INT             NULL,
    [TypeId]                          INT             NOT NULL,
    [Number]                          NVARCHAR (50)   NOT NULL,
    [Issuer]                          NVARCHAR (200)  NOT NULL,
    [PlaintiffIBAN]                   NVARCHAR (24)   NULL,
    [HasFinicalClaim]                 BIT             NULL,
    [FinicalClaimAmount]              DECIMAL (12, 2) NULL,
    [FinicalClaimAmountAsText]        NVARCHAR (200)  NULL,
    [Statement]                       NVARCHAR (MAX)  NOT NULL,
    [EnforcementAttachmentId]         BIGINT          NOT NULL,
    [ExtraEnforcementAttachmentId]    BIGINT          NULL,
    [IssuePlace]                      NVARCHAR (200)  NOT NULL,
    [Date]                            DATE            NULL,
    [DateHijri]                       DECIMAL (8)     NULL,
    [CreatedAt]                       DATETIME2 (7)   DEFAULT (getdate()) NOT NULL,
    [CreatedById]                     INT             NOT NULL,
    [UpdatedAt]                       DATETIME2 (7)   DEFAULT (getdate()) NULL,
    [UpdatedBy]                       INT             NULL,
    [FinicalClaim_CurrencyId]         INT             NULL,
    [AccountValidationIdentityTypeId] INT             NULL,
    CONSTRAINT [PK_Enforcements] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Enforcements_AccountValidationIdentityTypes_AccountValidationIdentityTypeId] FOREIGN KEY ([AccountValidationIdentityTypeId]) REFERENCES [LK].[AccountValidationIdentityTypes] ([Id]),
    CONSTRAINT [FK_Enforcements_Attachments_EnforcementAttachmentId] FOREIGN KEY ([EnforcementAttachmentId]) REFERENCES [ATTACH].[Attachments] ([Id]),
    CONSTRAINT [FK_Enforcements_Attachments_ExtraEnforcementAttachmentId] FOREIGN KEY ([ExtraEnforcementAttachmentId]) REFERENCES [ATTACH].[Attachments] ([Id]),
    CONSTRAINT [FK_Enforcements_Currencies_FinicalClaim_CurrencyId] FOREIGN KEY ([FinicalClaim_CurrencyId]) REFERENCES [LK].[Currencies] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_Enforcements_EnforcementTypes_TypeId] FOREIGN KEY ([TypeId]) REFERENCES [EXR].[EnforcementTypes] ([Id]),
    CONSTRAINT [FK_Enforcements_ExecutionRequests_ExecutionRequestId] FOREIGN KEY ([ExecutionRequestId]) REFERENCES [EXR].[ExecutionRequests] ([Id]),
    CONSTRAINT [FK_Enforcements_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_Enforcements_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Enforcements_AccountValidationIdentityTypeId]
    ON [EXR].[Enforcements]([AccountValidationIdentityTypeId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Enforcements_FinicalClaim_CurrencyId]
    ON [EXR].[Enforcements]([FinicalClaim_CurrencyId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Enforcements_UpdatedBy]
    ON [EXR].[Enforcements]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Enforcements_TypeId]
    ON [EXR].[Enforcements]([TypeId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Enforcements_ExtraEnforcementAttachmentId]
    ON [EXR].[Enforcements]([ExtraEnforcementAttachmentId] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Enforcements_ExecutionRequestId]
    ON [EXR].[Enforcements]([ExecutionRequestId] ASC) WHERE ([ExecutionRequestId] IS NOT NULL);


GO
CREATE NONCLUSTERED INDEX [IX_Enforcements_EnforcementAttachmentId]
    ON [EXR].[Enforcements]([EnforcementAttachmentId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Enforcements_CreatedById]
    ON [EXR].[Enforcements]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Enforcement', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'Enforcements', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Enforcement', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'Enforcements', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Enforcement', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'Enforcements', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Enforcement', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'Enforcements', @level2type = N'COLUMN', @level2name = N'CreatedAt';

