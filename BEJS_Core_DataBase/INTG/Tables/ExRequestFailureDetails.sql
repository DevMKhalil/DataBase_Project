CREATE TABLE [INTG].[ExRequestFailureDetails] (
    [Id]                BIGINT         IDENTITY (1, 1) NOT NULL,
    [FailureReasonId]   INT            NOT NULL,
    [RequestTempDataId] INT            NOT NULL,
    [PropertyPath]      NVARCHAR (MAX) NULL,
    [CreatedAt]         DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    [CreatedById]       INT            NOT NULL,
    CONSTRAINT [PK_ExRequestFailureDetails] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ExRequestFailureDetails_ExectionRequestTempData_RequestTempDataId] FOREIGN KEY ([RequestTempDataId]) REFERENCES [INTG].[ExectionRequestTempData] ([Id]),
    CONSTRAINT [FK_ExRequestFailureDetails_ExRequestTempFailureReasons_FailureReasonId] FOREIGN KEY ([FailureReasonId]) REFERENCES [IntgLK].[ExRequestTempFailureReasons] ([Code]),
    CONSTRAINT [FK_ExRequestFailureDetails_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_ExRequestFailureDetails_RequestTempDataId]
    ON [INTG].[ExRequestFailureDetails]([RequestTempDataId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ExRequestFailureDetails_FailureReasonId]
    ON [INTG].[ExRequestFailureDetails]([FailureReasonId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ExRequestFailureDetails_CreatedById]
    ON [INTG].[ExRequestFailureDetails]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Integration Request Failure Details', @level0type = N'SCHEMA', @level0name = N'INTG', @level1type = N'TABLE', @level1name = N'ExRequestFailureDetails', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Integration Request Failure Details', @level0type = N'SCHEMA', @level0name = N'INTG', @level1type = N'TABLE', @level1name = N'ExRequestFailureDetails', @level2type = N'COLUMN', @level2name = N'CreatedAt';

