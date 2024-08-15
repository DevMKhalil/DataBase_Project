CREATE TABLE [JCRT].[CircuitMemberQRCodes] (
    [Id]                              INT                                                IDENTITY (1, 1) NOT NULL,
    [EncryptedId]                     NVARCHAR (MAX)                                     NULL,
    [CircuitId]                       INT                                                NOT NULL,
    [JudgeId]                         INT                                                NOT NULL,
    [SecretaryId]                     INT                                                NOT NULL,
    [AttcahemtId]                     BIGINT                                             NULL,
    [RequestJudicialActionId]         INT                                                NULL,
    [ValidTo]                         DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom]                       DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    [CreatedAt]                       DATETIME2 (7)                                      DEFAULT (getdate()) NOT NULL,
    [CreatedById]                     INT                                                NOT NULL,
    [UpdatedAt]                       DATETIME2 (7)                                      DEFAULT (getdate()) NULL,
    [UpdatedBy]                       INT                                                NULL,
    [EncryptedVerificationCodeNumber] NVARCHAR (MAX)                                     NULL,
    [VerificationAttachmentId]        BIGINT                                             NULL,
    [VerificationCodeNumber]          BIGINT                                             NULL,
    [GuidanceRequestJudicialActionId] INT                                                NULL,
    CONSTRAINT [PK_CircuitMemberQRCodes] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_CircuitMemberQRCodes_Attachments_AttcahemtId] FOREIGN KEY ([AttcahemtId]) REFERENCES [ATTACH].[Attachments] ([Id]),
    CONSTRAINT [FK_CircuitMemberQRCodes_Attachments_VerificationAttachmentId] FOREIGN KEY ([VerificationAttachmentId]) REFERENCES [ATTACH].[Attachments] ([Id]),
    CONSTRAINT [FK_CircuitMemberQRCodes_Circuits_CircuitId] FOREIGN KEY ([CircuitId]) REFERENCES [JCRT].[Circuits] ([Id]),
    CONSTRAINT [FK_CircuitMemberQRCodes_GuidanceRequestActions_GuidanceRequestJudicialActionId] FOREIGN KEY ([GuidanceRequestJudicialActionId]) REFERENCES [GUDR].[GuidanceRequestActions] ([Id]),
    CONSTRAINT [FK_CircuitMemberQRCodes_RequestJudicialActions_RequestJudicialActionId] FOREIGN KEY ([RequestJudicialActionId]) REFERENCES [JACT].[RequestJudicialActions] ([Id]),
    CONSTRAINT [FK_CircuitMemberQRCodes_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_CircuitMemberQRCodes_Users_JudgeId] FOREIGN KEY ([JudgeId]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_CircuitMemberQRCodes_Users_SecretaryId] FOREIGN KEY ([SecretaryId]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_CircuitMemberQRCodes_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id]),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[JCRT].[CircuitMemberQRCodesHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [IX_CircuitMemberQRCodes_GuidanceRequestJudicialActionId]
    ON [JCRT].[CircuitMemberQRCodes]([GuidanceRequestJudicialActionId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CircuitMemberQRCodes_VerificationAttachmentId]
    ON [JCRT].[CircuitMemberQRCodes]([VerificationAttachmentId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CircuitMemberQRCodes_UpdatedBy]
    ON [JCRT].[CircuitMemberQRCodes]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CircuitMemberQRCodes_SecretaryId]
    ON [JCRT].[CircuitMemberQRCodes]([SecretaryId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CircuitMemberQRCodes_RequestJudicialActionId]
    ON [JCRT].[CircuitMemberQRCodes]([RequestJudicialActionId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CircuitMemberQRCodes_JudgeId]
    ON [JCRT].[CircuitMemberQRCodes]([JudgeId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CircuitMemberQRCodes_CreatedById]
    ON [JCRT].[CircuitMemberQRCodes]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CircuitMemberQRCodes_CircuitId]
    ON [JCRT].[CircuitMemberQRCodes]([CircuitId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CircuitMemberQRCodes_AttcahemtId]
    ON [JCRT].[CircuitMemberQRCodes]([AttcahemtId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Judical Circuit Member Q R Code', @level0type = N'SCHEMA', @level0name = N'JCRT', @level1type = N'TABLE', @level1name = N'CircuitMemberQRCodes', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Judical Circuit Member Q R Code', @level0type = N'SCHEMA', @level0name = N'JCRT', @level1type = N'TABLE', @level1name = N'CircuitMemberQRCodes', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Judical Circuit Member Q R Code', @level0type = N'SCHEMA', @level0name = N'JCRT', @level1type = N'TABLE', @level1name = N'CircuitMemberQRCodes', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Judical Circuit Member Q R Code', @level0type = N'SCHEMA', @level0name = N'JCRT', @level1type = N'TABLE', @level1name = N'CircuitMemberQRCodes', @level2type = N'COLUMN', @level2name = N'CreatedAt';

