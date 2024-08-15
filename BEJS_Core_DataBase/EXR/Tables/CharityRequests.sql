CREATE TABLE [EXR].[CharityRequests] (
    [Id] INT NOT NULL,
    CONSTRAINT [PK_CharityRequests] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_CharityRequests_ExecutionRequests_Id] FOREIGN KEY ([Id]) REFERENCES [EXR].[ExecutionRequests] ([Id]) ON DELETE CASCADE
);

