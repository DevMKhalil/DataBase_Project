CREATE TABLE [EXR].[WaqfRequests] (
    [Id]                        INT NOT NULL,
    [PlaintiffRepresentativeId] INT NULL,
    CONSTRAINT [PK_WaqfRequests] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_WaqfRequests_ExecutionRequests_Id] FOREIGN KEY ([Id]) REFERENCES [EXR].[ExecutionRequests] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_WaqfRequests_WaqPlaintiffRepresentatives_PlaintiffRepresentativeId] FOREIGN KEY ([PlaintiffRepresentativeId]) REFERENCES [EXR].[WaqPlaintiffRepresentatives] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_WaqfRequests_PlaintiffRepresentativeId]
    ON [EXR].[WaqfRequests]([PlaintiffRepresentativeId] ASC);

