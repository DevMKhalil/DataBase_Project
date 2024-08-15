CREATE TABLE [EXR].[RequestNotes] (
    [Id]                 INT            IDENTITY (1, 1) NOT NULL,
    [Note]               NVARCHAR (MAX) NULL,
    [RequestId]          INT            NOT NULL,
    [SectionId]          TINYINT        NOT NULL,
    [RequestStatusLogId] INT            NULL,
    [ReturnReasonId]     SMALLINT       NOT NULL,
    [IsSubmitted]        BIT            NOT NULL,
    [CreatedAt]          DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    [CreatedById]        INT            NOT NULL,
    [UpdatedAt]          DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [UpdatedBy]          INT            NULL,
    CONSTRAINT [PK_RequestNotes] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_RequestNotes_ExecutionRequests_RequestId] FOREIGN KEY ([RequestId]) REFERENCES [EXR].[ExecutionRequests] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_RequestNotes_RequestStatusLogs_RequestStatusLogId] FOREIGN KEY ([RequestStatusLogId]) REFERENCES [EXR].[RequestStatusLogs] ([Id]),
    CONSTRAINT [FK_RequestNotes_ReturnReasons_ReturnReasonId] FOREIGN KEY ([ReturnReasonId]) REFERENCES [ExrLK].[ReturnReasons] ([Code]),
    CONSTRAINT [FK_RequestNotes_SectionsLK_SectionId] FOREIGN KEY ([SectionId]) REFERENCES [ExrLK].[SectionsLK] ([Code]),
    CONSTRAINT [FK_RequestNotes_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_RequestNotes_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_RequestNotes_UpdatedBy]
    ON [EXR].[RequestNotes]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RequestNotes_SectionId]
    ON [EXR].[RequestNotes]([SectionId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RequestNotes_ReturnReasonId]
    ON [EXR].[RequestNotes]([ReturnReasonId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RequestNotes_RequestStatusLogId]
    ON [EXR].[RequestNotes]([RequestStatusLogId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RequestNotes_RequestId]
    ON [EXR].[RequestNotes]([RequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RequestNotes_CreatedById]
    ON [EXR].[RequestNotes]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Request Note', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'RequestNotes', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Request Note', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'RequestNotes', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Request Note', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'RequestNotes', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Request Note', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'RequestNotes', @level2type = N'COLUMN', @level2name = N'CreatedAt';

