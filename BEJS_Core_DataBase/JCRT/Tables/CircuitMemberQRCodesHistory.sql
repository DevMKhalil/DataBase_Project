CREATE TABLE [JCRT].[CircuitMemberQRCodesHistory] (
    [Id]                              INT            NOT NULL,
    [EncryptedId]                     NVARCHAR (MAX) NULL,
    [CircuitId]                       INT            NOT NULL,
    [JudgeId]                         INT            NOT NULL,
    [SecretaryId]                     INT            NOT NULL,
    [AttcahemtId]                     BIGINT         NULL,
    [RequestJudicialActionId]         INT            NULL,
    [ValidTo]                         DATETIME2 (7)  NOT NULL,
    [ValidFrom]                       DATETIME2 (7)  NOT NULL,
    [CreatedAt]                       DATETIME2 (7)  NOT NULL,
    [CreatedById]                     INT            NOT NULL,
    [UpdatedAt]                       DATETIME2 (7)  NULL,
    [UpdatedBy]                       INT            NULL,
    [EncryptedVerificationCodeNumber] NVARCHAR (MAX) NULL,
    [VerificationAttachmentId]        BIGINT         NULL,
    [VerificationCodeNumber]          BIGINT         NULL,
    [GuidanceRequestJudicialActionId] INT            NULL
);


GO
CREATE CLUSTERED INDEX [ix_CircuitMemberQRCodesHistory]
    ON [JCRT].[CircuitMemberQRCodesHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

