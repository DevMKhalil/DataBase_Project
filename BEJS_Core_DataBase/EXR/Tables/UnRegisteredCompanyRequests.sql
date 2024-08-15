CREATE TABLE [EXR].[UnRegisteredCompanyRequests] (
    [Id]                        INT NOT NULL,
    [PlaintiffRepresentativeId] INT NULL,
    CONSTRAINT [PK_UnRegisteredCompanyRequests] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_UnRegisteredCompanyRequests_ExecutionRequests_Id] FOREIGN KEY ([Id]) REFERENCES [EXR].[ExecutionRequests] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_UnRegisteredCompanyRequests_UnRegisteredCompanyPlaintiffRepresentatives_PlaintiffRepresentativeId] FOREIGN KEY ([PlaintiffRepresentativeId]) REFERENCES [EXR].[UnRegisteredCompanyPlaintiffRepresentatives] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_UnRegisteredCompanyRequests_PlaintiffRepresentativeId]
    ON [EXR].[UnRegisteredCompanyRequests]([PlaintiffRepresentativeId] ASC);

