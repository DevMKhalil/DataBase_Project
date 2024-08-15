CREATE TABLE [EXR].[NonProfitInstitutionRequests] (
    [Id]                        INT NOT NULL,
    [PlaintiffRepresentativeId] INT NULL,
    CONSTRAINT [PK_NonProfitInstitutionRequests] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_NonProfitInstitutionRequests_ExecutionRequests_Id] FOREIGN KEY ([Id]) REFERENCES [EXR].[ExecutionRequests] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_NonProfitInstitutionRequests_NonProfitInstitutionPlaintiffRepresentatives_PlaintiffRepresentativeId] FOREIGN KEY ([PlaintiffRepresentativeId]) REFERENCES [EXR].[NonProfitInstitutionPlaintiffRepresentatives] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_NonProfitInstitutionRequests_PlaintiffRepresentativeId]
    ON [EXR].[NonProfitInstitutionRequests]([PlaintiffRepresentativeId] ASC);

