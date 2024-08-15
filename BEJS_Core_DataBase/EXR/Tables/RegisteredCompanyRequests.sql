CREATE TABLE [EXR].[RegisteredCompanyRequests] (
    [Id]                        INT NOT NULL,
    [PlaintiffRepresentativeId] INT NULL,
    CONSTRAINT [PK_RegisteredCompanyRequests] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_RegisteredCompanyRequests_ExecutionRequests_Id] FOREIGN KEY ([Id]) REFERENCES [EXR].[ExecutionRequests] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_RegisteredCompanyRequests_RegisteredCompanyPlaintiffRepresentatives_PlaintiffRepresentativeId] FOREIGN KEY ([PlaintiffRepresentativeId]) REFERENCES [EXR].[RegisteredCompanyPlaintiffRepresentatives] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_RegisteredCompanyRequests_PlaintiffRepresentativeId]
    ON [EXR].[RegisteredCompanyRequests]([PlaintiffRepresentativeId] ASC);

