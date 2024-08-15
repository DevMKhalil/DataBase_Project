CREATE TABLE [ExrLK].[IdentifiersForType] (
    [ExecutionRequestTypeCode] SMALLINT      NOT NULL,
    [IdentifierCode]           SMALLINT      NOT NULL,
    [CreatedAt]                DATETIME2 (7) NOT NULL,
    [IsActive]                 BIT           NOT NULL,
    CONSTRAINT [PK_IdentifiersForType] PRIMARY KEY CLUSTERED ([IdentifierCode] ASC, [ExecutionRequestTypeCode] ASC),
    CONSTRAINT [FK_IdentifiersForType_Identifiers_IdentifierCode] FOREIGN KEY ([IdentifierCode]) REFERENCES [ExrLK].[Identifiers] ([Code]),
    CONSTRAINT [FK_IdentifiersForType_Types_ExecutionRequestTypeCode] FOREIGN KEY ([ExecutionRequestTypeCode]) REFERENCES [ExrLK].[Types] ([Code])
);


GO
CREATE NONCLUSTERED INDEX [IX_IdentifiersForType_ExecutionRequestTypeCode]
    ON [ExrLK].[IdentifiersForType]([ExecutionRequestTypeCode] ASC);

