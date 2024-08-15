CREATE TABLE [SECR].[SecondaryRequestNotes] (
    [Id]                 INT            IDENTITY (1, 1) NOT NULL,
    [ReturnReasonCode]   SMALLINT       NOT NULL,
    [SecondaryRequestId] INT            NOT NULL,
    [CreatedAt]          DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    [CreatedById]        INT            NOT NULL,
    [UpdatedAt]          DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [UpdatedBy]          INT            NULL,
    [SectionId]          TINYINT        NULL,
    [IsSubmitted]        BIT            DEFAULT (CONVERT([bit],(0))) NOT NULL,
    [Note]               NVARCHAR (MAX) NULL,
    [RequestStatusLogId] INT            NULL,
    CONSTRAINT [PK_SecondaryRequestNotes] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SecondaryRequestNotes_SecondaryRequestReturnReasons_ReturnReasonCode] FOREIGN KEY ([ReturnReasonCode]) REFERENCES [SecrLK].[SecondaryRequestReturnReasons] ([Code]),
    CONSTRAINT [FK_SecondaryRequestNotes_SecondaryRequests_SecondaryRequestId] FOREIGN KEY ([SecondaryRequestId]) REFERENCES [SECR].[SecondaryRequests] ([Id]),
    CONSTRAINT [FK_SecondaryRequestNotes_SecondaryRequestStatusLogs_RequestStatusLogId] FOREIGN KEY ([RequestStatusLogId]) REFERENCES [SECR].[SecondaryRequestStatusLogs] ([Id]),
    CONSTRAINT [FK_SecondaryRequestNotes_SectionsLK_SectionId] FOREIGN KEY ([SectionId]) REFERENCES [ExrLK].[SectionsLK] ([Code]),
    CONSTRAINT [FK_SecondaryRequestNotes_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_SecondaryRequestNotes_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_SecondaryRequestNotes_RequestStatusLogId]
    ON [SECR].[SecondaryRequestNotes]([RequestStatusLogId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SecondaryRequestNotes_SectionId]
    ON [SECR].[SecondaryRequestNotes]([SectionId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SecondaryRequestNotes_UpdatedBy]
    ON [SECR].[SecondaryRequestNotes]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SecondaryRequestNotes_SecondaryRequestId]
    ON [SECR].[SecondaryRequestNotes]([SecondaryRequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SecondaryRequestNotes_ReturnReasonCode]
    ON [SECR].[SecondaryRequestNotes]([ReturnReasonCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SecondaryRequestNotes_CreatedById]
    ON [SECR].[SecondaryRequestNotes]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Section Id  => it is used to determine the related section', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'SecondaryRequestNotes', @level2type = N'COLUMN', @level2name = N'SectionId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Secondary Request Note', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'SecondaryRequestNotes', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Secondary Request Note', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'SecondaryRequestNotes', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Secondary Request Note', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'SecondaryRequestNotes', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Secondary Request Note', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'SecondaryRequestNotes', @level2type = N'COLUMN', @level2name = N'CreatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Secondary Request Id => it is used to determine the related secondary request', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'SecondaryRequestNotes', @level2type = N'COLUMN', @level2name = N'SecondaryRequestId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Return Reason Code => it is used to determine the related return reason', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'SecondaryRequestNotes', @level2type = N'COLUMN', @level2name = N'ReturnReasonCode';

