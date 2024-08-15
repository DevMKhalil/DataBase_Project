CREATE TABLE [EXR].[IndividualRequests] (
    [Id]                        INT NOT NULL,
    [PlaintiffRepresentativeId] INT NULL,
    CONSTRAINT [PK_IndividualRequests] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_IndividualRequests_ExecutionRequests_Id] FOREIGN KEY ([Id]) REFERENCES [EXR].[ExecutionRequests] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_IndividualRequests_IndividualPlaintiffRepresentatives_PlaintiffRepresentativeId] FOREIGN KEY ([PlaintiffRepresentativeId]) REFERENCES [EXR].[IndividualPlaintiffRepresentatives] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_IndividualRequests_PlaintiffRepresentativeId]
    ON [EXR].[IndividualRequests]([PlaintiffRepresentativeId] ASC);

