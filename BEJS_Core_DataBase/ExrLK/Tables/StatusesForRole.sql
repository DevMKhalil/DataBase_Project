CREATE TABLE [ExrLK].[StatusesForRole] (
    [StatusCode] SMALLINT      NOT NULL,
    [RoleCode]   INT           NOT NULL,
    [CreatedAt]  DATETIME2 (7) NOT NULL,
    [IsActive]   BIT           NOT NULL,
    CONSTRAINT [PK_StatusesForRole] PRIMARY KEY CLUSTERED ([RoleCode] ASC, [StatusCode] ASC),
    CONSTRAINT [FK_StatusesForRole_Roles_RoleCode] FOREIGN KEY ([RoleCode]) REFERENCES [AUTH].[Roles] ([Code]),
    CONSTRAINT [FK_StatusesForRole_Statuses_StatusCode] FOREIGN KEY ([StatusCode]) REFERENCES [ExrLK].[Statuses] ([Code])
);


GO
CREATE NONCLUSTERED INDEX [IX_StatusesForRole_StatusCode]
    ON [ExrLK].[StatusesForRole]([StatusCode] ASC);

