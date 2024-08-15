CREATE TABLE [JACT].[RequestSubJudicialActions] (
    [Id]                      INT            IDENTITY (1, 1) NOT NULL,
    [RequestJudicialActionId] INT            NOT NULL,
    [TypeCode]                SMALLINT       NOT NULL,
    [Notes]                   NVARCHAR (MAX) NULL,
    [DocumentId]              BIGINT         NOT NULL,
    [CreatedAt]               DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    [CreatedById]             INT            NOT NULL,
    [UpdatedAt]               DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [UpdatedBy]               INT            NULL,
    CONSTRAINT [PK_RequestSubJudicialActions] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_RequestSubJudicialActions_Attachments_DocumentId] FOREIGN KEY ([DocumentId]) REFERENCES [ATTACH].[Attachments] ([Id]),
    CONSTRAINT [FK_RequestSubJudicialActions_RequestJudicialActions_RequestJudicialActionId] FOREIGN KEY ([RequestJudicialActionId]) REFERENCES [JACT].[RequestJudicialActions] ([Id]),
    CONSTRAINT [FK_RequestSubJudicialActions_SubJudicialActionTypes_TypeCode] FOREIGN KEY ([TypeCode]) REFERENCES [JACT].[SubJudicialActionTypes] ([Code]),
    CONSTRAINT [FK_RequestSubJudicialActions_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_RequestSubJudicialActions_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_RequestSubJudicialActions_UpdatedBy]
    ON [JACT].[RequestSubJudicialActions]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RequestSubJudicialActions_TypeCode]
    ON [JACT].[RequestSubJudicialActions]([TypeCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RequestSubJudicialActions_RequestJudicialActionId]
    ON [JACT].[RequestSubJudicialActions]([RequestJudicialActionId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RequestSubJudicialActions_DocumentId]
    ON [JACT].[RequestSubJudicialActions]([DocumentId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RequestSubJudicialActions_CreatedById]
    ON [JACT].[RequestSubJudicialActions]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Execution Request Sub Judicial Action', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'RequestSubJudicialActions', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Execution Request Sub Judicial Action', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'RequestSubJudicialActions', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Execution Request Sub Judicial Action', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'RequestSubJudicialActions', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Execution Request Sub Judicial Action', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'RequestSubJudicialActions', @level2type = N'COLUMN', @level2name = N'CreatedAt';

