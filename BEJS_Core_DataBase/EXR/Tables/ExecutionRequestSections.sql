CREATE TABLE [EXR].[ExecutionRequestSections] (
    [Id]          INT     IDENTITY (1, 1) NOT NULL,
    [RequestId]   INT     NOT NULL,
    [SectionCode] TINYINT NOT NULL,
    [IsSubmitted] BIT     NOT NULL,
    CONSTRAINT [PK_ExecutionRequestSections] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ExecutionRequestSections_ExecutionRequests_RequestId] FOREIGN KEY ([RequestId]) REFERENCES [EXR].[ExecutionRequests] ([Id]),
    CONSTRAINT [FK_ExecutionRequestSections_SectionsLK_SectionCode] FOREIGN KEY ([SectionCode]) REFERENCES [ExrLK].[SectionsLK] ([Code])
);


GO
CREATE NONCLUSTERED INDEX [IX_ExecutionRequestSections_SectionCode]
    ON [EXR].[ExecutionRequestSections]([SectionCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ExecutionRequestSections_RequestId]
    ON [EXR].[ExecutionRequestSections]([RequestId] ASC);

