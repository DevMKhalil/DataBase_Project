CREATE TABLE [GUDR].[RequestSections] (
    [Id]          INT     IDENTITY (1, 1) NOT NULL,
    [RequestId]   INT     NOT NULL,
    [SectionCode] TINYINT NOT NULL,
    [IsSubmitted] BIT     NOT NULL,
    CONSTRAINT [PK_RequestSections] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_RequestSections_GuidanceRequests_RequestId] FOREIGN KEY ([RequestId]) REFERENCES [SECR].[GuidanceRequests] ([Id]),
    CONSTRAINT [FK_RequestSections_SectionsLK_SectionCode] FOREIGN KEY ([SectionCode]) REFERENCES [ExrLK].[SectionsLK] ([Code])
);


GO
CREATE NONCLUSTERED INDEX [IX_RequestSections_SectionCode]
    ON [GUDR].[RequestSections]([SectionCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RequestSections_RequestId]
    ON [GUDR].[RequestSections]([RequestId] ASC);

