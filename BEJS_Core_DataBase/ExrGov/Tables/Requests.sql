CREATE TABLE [ExrGov].[Requests] (
    [Id] INT NOT NULL,
    CONSTRAINT [PK_Requests] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Requests_ExecutionRequests_Id] FOREIGN KEY ([Id]) REFERENCES [EXR].[ExecutionRequests] ([Id]) ON DELETE CASCADE
);

