CREATE TABLE [ObjR].[ObjectionRequests] (
    [Id]                    INT            IDENTITY (1, 1) NOT NULL,
    [ExecutionRequestId]    INT            DEFAULT ((0)) NOT NULL,
    [Reason]                NVARCHAR (500) NULL,
    [ObjectionAttachmentId] BIGINT         NULL,
    [StatusCode]            SMALLINT       NOT NULL,
    [CreatedAt]             DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    [CreatedById]           INT            NOT NULL,
    [UpdatedAt]             DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [UpdatedBy]             INT            NULL,
    [GuidanceText]          NVARCHAR (500) NULL,
    [RejectReason]          NVARCHAR (500) NULL,
    CONSTRAINT [PK_ObjectionRequests] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ObjectionRequests_Attachments_ObjectionAttachmentId] FOREIGN KEY ([ObjectionAttachmentId]) REFERENCES [ATTACH].[Attachments] ([Id]),
    CONSTRAINT [FK_ObjectionRequests_ExecutionRequests_ExecutionRequestId] FOREIGN KEY ([ExecutionRequestId]) REFERENCES [EXR].[ExecutionRequests] ([Id]),
    CONSTRAINT [FK_ObjectionRequests_ObjectionRequestStatuses_StatusCode] FOREIGN KEY ([StatusCode]) REFERENCES [ObjR].[ObjectionRequestStatuses] ([Code]),
    CONSTRAINT [FK_ObjectionRequests_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_ObjectionRequests_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_ObjectionRequests_ExecutionRequestId]
    ON [ObjR].[ObjectionRequests]([ExecutionRequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ObjectionRequests_UpdatedBy]
    ON [ObjR].[ObjectionRequests]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ObjectionRequests_StatusCode]
    ON [ObjR].[ObjectionRequests]([StatusCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ObjectionRequests_ObjectionAttachmentId]
    ON [ObjR].[ObjectionRequests]([ObjectionAttachmentId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ObjectionRequests_CreatedById]
    ON [ObjR].[ObjectionRequests]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Objection Request', @level0type = N'SCHEMA', @level0name = N'ObjR', @level1type = N'TABLE', @level1name = N'ObjectionRequests', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Objection Request', @level0type = N'SCHEMA', @level0name = N'ObjR', @level1type = N'TABLE', @level1name = N'ObjectionRequests', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Objection Request', @level0type = N'SCHEMA', @level0name = N'ObjR', @level1type = N'TABLE', @level1name = N'ObjectionRequests', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Objection Request', @level0type = N'SCHEMA', @level0name = N'ObjR', @level1type = N'TABLE', @level1name = N'ObjectionRequests', @level2type = N'COLUMN', @level2name = N'CreatedAt';

