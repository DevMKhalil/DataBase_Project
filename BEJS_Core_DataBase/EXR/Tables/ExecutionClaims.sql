CREATE TABLE [EXR].[ExecutionClaims] (
    [ExecutionRequestId]         INT           NOT NULL,
    [Date]                       DATE          NULL,
    [DateHijri]                  DECIMAL (8)   NULL,
    [RequestNumber]              NVARCHAR (50) NULL,
    [ResultId]                   INT           NULL,
    [ExecutionClaimAttachmentId] BIGINT        NOT NULL,
    [ProofOfSubmitAttachmentId]  BIGINT        NOT NULL,
    [CreatedAt]                  DATETIME2 (7) DEFAULT (getdate()) NOT NULL,
    [CreatedById]                INT           NOT NULL,
    [UpdatedAt]                  DATETIME2 (7) DEFAULT (getdate()) NULL,
    [UpdatedBy]                  INT           NULL,
    CONSTRAINT [PK_ExecutionClaims] PRIMARY KEY CLUSTERED ([ExecutionRequestId] ASC),
    CONSTRAINT [FK_ExecutionClaims_Attachments_ExecutionClaimAttachmentId] FOREIGN KEY ([ExecutionClaimAttachmentId]) REFERENCES [ATTACH].[Attachments] ([Id]),
    CONSTRAINT [FK_ExecutionClaims_Attachments_ProofOfSubmitAttachmentId] FOREIGN KEY ([ProofOfSubmitAttachmentId]) REFERENCES [ATTACH].[Attachments] ([Id]),
    CONSTRAINT [FK_ExecutionClaims_ExecutionClaimResults_ResultId] FOREIGN KEY ([ResultId]) REFERENCES [EXR].[ExecutionClaimResults] ([Id]),
    CONSTRAINT [FK_ExecutionClaims_ExecutionRequests_ExecutionRequestId] FOREIGN KEY ([ExecutionRequestId]) REFERENCES [EXR].[ExecutionRequests] ([Id]),
    CONSTRAINT [FK_ExecutionClaims_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_ExecutionClaims_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_ExecutionClaims_UpdatedBy]
    ON [EXR].[ExecutionClaims]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ExecutionClaims_ResultId]
    ON [EXR].[ExecutionClaims]([ResultId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ExecutionClaims_ProofOfSubmitAttachmentId]
    ON [EXR].[ExecutionClaims]([ProofOfSubmitAttachmentId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ExecutionClaims_ExecutionClaimAttachmentId]
    ON [EXR].[ExecutionClaims]([ExecutionClaimAttachmentId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ExecutionClaims_CreatedById]
    ON [EXR].[ExecutionClaims]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Execution Claim', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'ExecutionClaims', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Execution Claim', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'ExecutionClaims', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Execution Claim', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'ExecutionClaims', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Execution Claim', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'ExecutionClaims', @level2type = N'COLUMN', @level2name = N'CreatedAt';

