CREATE TABLE [JSES].[Sessions] (
    [Id]                 INT            IDENTITY (1, 1) NOT NULL,
    [ExecutionRequestId] INT            NOT NULL,
    [TypeCode]           SMALLINT       NOT NULL,
    [StartDate]          DATE           NOT NULL,
    [StartDateHijri]     DECIMAL (8)    NOT NULL,
    [StartTime]          TIME (7)       NOT NULL,
    [EndDate]            DATE           NOT NULL,
    [EndDateHijri]       DECIMAL (8)    NOT NULL,
    [EndTime]            TIME (7)       NOT NULL,
    [ActionTypeCode]     SMALLINT       NOT NULL,
    [Notes]              NVARCHAR (150) NULL,
    [IsRescheduled]      BIT            NULL,
    [MeetingUrl]         NVARCHAR (500) NOT NULL,
    [CreatedAt]          DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    [CreatedById]        INT            NOT NULL,
    [UpdatedAt]          DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [UpdatedBy]          INT            NULL,
    [IsDeleted]          BIT            NOT NULL,
    [DeletedAt]          DATETIME2 (7)  NULL,
    [DeletedBy]          INT            NULL,
    CONSTRAINT [PK_Sessions] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Sessions_ActionTypes_ActionTypeCode] FOREIGN KEY ([ActionTypeCode]) REFERENCES [JACT].[ActionTypes] ([Code]),
    CONSTRAINT [FK_Sessions_ExecutionRequests_ExecutionRequestId] FOREIGN KEY ([ExecutionRequestId]) REFERENCES [EXR].[ExecutionRequests] ([Id]),
    CONSTRAINT [FK_Sessions_SessionTypes_TypeCode] FOREIGN KEY ([TypeCode]) REFERENCES [JSES].[SessionTypes] ([Code]),
    CONSTRAINT [FK_Sessions_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_Sessions_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Sessions_UpdatedBy]
    ON [JSES].[Sessions]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Sessions_TypeCode]
    ON [JSES].[Sessions]([TypeCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Sessions_ExecutionRequestId]
    ON [JSES].[Sessions]([ExecutionRequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Sessions_CreatedById]
    ON [JSES].[Sessions]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Sessions_ActionTypeCode]
    ON [JSES].[Sessions]([ActionTypeCode] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Judicial Session', @level0type = N'SCHEMA', @level0name = N'JSES', @level1type = N'TABLE', @level1name = N'Sessions', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Judicial Session', @level0type = N'SCHEMA', @level0name = N'JSES', @level1type = N'TABLE', @level1name = N'Sessions', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Judicial Session', @level0type = N'SCHEMA', @level0name = N'JSES', @level1type = N'TABLE', @level1name = N'Sessions', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Judicial Session', @level0type = N'SCHEMA', @level0name = N'JSES', @level1type = N'TABLE', @level1name = N'Sessions', @level2type = N'COLUMN', @level2name = N'CreatedAt';

