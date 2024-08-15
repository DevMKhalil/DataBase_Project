CREATE TABLE [SECR].[SecondaryRequests] (
    [Id]                  INT           IDENTITY (1, 1) NOT NULL,
    [ExecutionRequestId]  INT           NULL,
    [TypeCode]            SMALLINT      NOT NULL,
    [StatusCode]          SMALLINT      NOT NULL,
    [AttachmentId]        BIGINT        NULL,
    [SubmissionNo]        BIGINT        NULL,
    [RecordNumber]        BIGINT        NULL,
    [JudicialCircuitId]   INT           NULL,
    [JudgeRejectReasonId] INT           NULL,
    [CreatedAt]           DATETIME2 (7) DEFAULT (getdate()) NOT NULL,
    [CreatedById]         INT           NOT NULL,
    [UpdatedAt]           DATETIME2 (7) DEFAULT (getdate()) NULL,
    [UpdatedBy]           INT           NULL,
    CONSTRAINT [PK_SecondaryRequests] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SecondaryRequests_Attachments_AttachmentId] FOREIGN KEY ([AttachmentId]) REFERENCES [ATTACH].[Attachments] ([Id]),
    CONSTRAINT [FK_SecondaryRequests_Circuits_JudicialCircuitId] FOREIGN KEY ([JudicialCircuitId]) REFERENCES [JCRT].[Circuits] ([Id]),
    CONSTRAINT [FK_SecondaryRequests_ExecutionRequests_ExecutionRequestId] FOREIGN KEY ([ExecutionRequestId]) REFERENCES [EXR].[ExecutionRequests] ([Id]),
    CONSTRAINT [FK_SecondaryRequests_SecondaryRequestRejectReasons_JudgeRejectReasonId] FOREIGN KEY ([JudgeRejectReasonId]) REFERENCES [SECR].[SecondaryRequestRejectReasons] ([Id]),
    CONSTRAINT [FK_SecondaryRequests_SecondaryRequestStatuses_StatusCode] FOREIGN KEY ([StatusCode]) REFERENCES [SecrLK].[SecondaryRequestStatuses] ([Code]),
    CONSTRAINT [FK_SecondaryRequests_SecondaryRequestTypes_TypeCode] FOREIGN KEY ([TypeCode]) REFERENCES [SecrLK].[SecondaryRequestTypes] ([Code]),
    CONSTRAINT [FK_SecondaryRequests_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_SecondaryRequests_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_SecondaryRequests_UpdatedBy]
    ON [SECR].[SecondaryRequests]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SecondaryRequests_TypeCode]
    ON [SECR].[SecondaryRequests]([TypeCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SecondaryRequests_StatusCode]
    ON [SECR].[SecondaryRequests]([StatusCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SecondaryRequests_JudicialCircuitId]
    ON [SECR].[SecondaryRequests]([JudicialCircuitId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SecondaryRequests_JudgeRejectReasonId]
    ON [SECR].[SecondaryRequests]([JudgeRejectReasonId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SecondaryRequests_ExecutionRequestId]
    ON [SECR].[SecondaryRequests]([ExecutionRequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SecondaryRequests_CreatedById]
    ON [SECR].[SecondaryRequests]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SecondaryRequests_AttachmentId]
    ON [SECR].[SecondaryRequests]([AttachmentId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Secondary Request', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'SecondaryRequests', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Secondary Request', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'SecondaryRequests', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Secondary Request', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'SecondaryRequests', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Secondary Request', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'SecondaryRequests', @level2type = N'COLUMN', @level2name = N'CreatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Judge Reject Reason Id => it is used to determine the related judge reject reason', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'SecondaryRequests', @level2type = N'COLUMN', @level2name = N'JudgeRejectReasonId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Judicial Circuit Id => it is used to determine the related judicial circuit', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'SecondaryRequests', @level2type = N'COLUMN', @level2name = N'JudicialCircuitId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Record Number => it is used to generate number on recording secondary request', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'SecondaryRequests', @level2type = N'COLUMN', @level2name = N'RecordNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Submission Number => it is used to generate number on submitting secondary request', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'SecondaryRequests', @level2type = N'COLUMN', @level2name = N'SubmissionNo';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Attachment Id => it is used to determine the related attachment', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'SecondaryRequests', @level2type = N'COLUMN', @level2name = N'AttachmentId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Status Code => it is used to determine the current status of secondary request', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'SecondaryRequests', @level2type = N'COLUMN', @level2name = N'StatusCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Type Code => it is used to differentiate between secondary request types', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'SecondaryRequests', @level2type = N'COLUMN', @level2name = N'TypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Execution Request Id => it is used to determine the related execution request', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'SecondaryRequests', @level2type = N'COLUMN', @level2name = N'ExecutionRequestId';

