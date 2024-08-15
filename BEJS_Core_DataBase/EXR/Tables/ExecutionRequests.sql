CREATE TABLE [EXR].[ExecutionRequests] (
    [Id]                  INT           IDENTITY (1, 1) NOT NULL,
    [CourtId]             INT           NOT NULL,
    [JudicialCircuitId]   INT           NULL,
    [IsUrgent]            BIT           NOT NULL,
    [TypeCode]            SMALLINT      NOT NULL,
    [StatusCode]          SMALLINT      NOT NULL,
    [SubmissionNo]        BIGINT        NULL,
    [CreatedAt]           DATETIME2 (7) DEFAULT (getdate()) NOT NULL,
    [CreatedById]         INT           NOT NULL,
    [UpdatedAt]           DATETIME2 (7) DEFAULT (getdate()) NULL,
    [UpdatedBy]           INT           NULL,
    [SourceCode]          SMALLINT      NULL,
    [ObjectionExpiryDate] DATE          NULL,
    CONSTRAINT [PK_ExecutionRequests] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ExecutionRequests_Circuits_JudicialCircuitId] FOREIGN KEY ([JudicialCircuitId]) REFERENCES [JCRT].[Circuits] ([Id]),
    CONSTRAINT [FK_ExecutionRequests_Courts_CourtId] FOREIGN KEY ([CourtId]) REFERENCES [LK].[Courts] ([Id]),
    CONSTRAINT [FK_ExecutionRequests_Sources_SourceCode] FOREIGN KEY ([SourceCode]) REFERENCES [ExrLK].[Sources] ([Code]),
    CONSTRAINT [FK_ExecutionRequests_Statuses_StatusCode] FOREIGN KEY ([StatusCode]) REFERENCES [ExrLK].[Statuses] ([Code]),
    CONSTRAINT [FK_ExecutionRequests_Types_TypeCode] FOREIGN KEY ([TypeCode]) REFERENCES [ExrLK].[Types] ([Code]),
    CONSTRAINT [FK_ExecutionRequests_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_ExecutionRequests_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_ExecutionRequests_SourceCode]
    ON [EXR].[ExecutionRequests]([SourceCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ExecutionRequests_UpdatedBy]
    ON [EXR].[ExecutionRequests]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ExecutionRequests_TypeCode]
    ON [EXR].[ExecutionRequests]([TypeCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ExecutionRequests_StatusCode]
    ON [EXR].[ExecutionRequests]([StatusCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ExecutionRequests_JudicialCircuitId]
    ON [EXR].[ExecutionRequests]([JudicialCircuitId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ExecutionRequests_CreatedById]
    ON [EXR].[ExecutionRequests]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ExecutionRequests_CourtId]
    ON [EXR].[ExecutionRequests]([CourtId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Waqf Request', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'ExecutionRequests', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Waqf Request', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'ExecutionRequests', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Waqf Request', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'ExecutionRequests', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Waqf Request', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'ExecutionRequests', @level2type = N'COLUMN', @level2name = N'CreatedAt';

