CREATE TABLE [ATTACH].[Attachments] (
    [Id]          BIGINT           IDENTITY (1, 1) NOT NULL,
    [TypeCode]    INT              NOT NULL,
    [ReferenceId] UNIQUEIDENTIFIER NOT NULL,
    [CreatedAt]   DATETIME2 (7)    DEFAULT (getdate()) NOT NULL,
    [CreatedById] INT              NOT NULL,
    [UpdatedAt]   DATETIME2 (7)    DEFAULT (getdate()) NULL,
    [UpdatedBy]   INT              NULL,
    CONSTRAINT [PK_Attachments] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Attachments_AttachmentTypes_TypeCode] FOREIGN KEY ([TypeCode]) REFERENCES [ATTACH].[AttachmentTypes] ([Code])
);


GO
CREATE NONCLUSTERED INDEX [IX_Attachments_UpdatedBy]
    ON [ATTACH].[Attachments]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Attachments_TypeCode]
    ON [ATTACH].[Attachments]([TypeCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Attachments_CreatedById]
    ON [ATTACH].[Attachments]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Attachment', @level0type = N'SCHEMA', @level0name = N'ATTACH', @level1type = N'TABLE', @level1name = N'Attachments', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Attachment', @level0type = N'SCHEMA', @level0name = N'ATTACH', @level1type = N'TABLE', @level1name = N'Attachments', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Attachment', @level0type = N'SCHEMA', @level0name = N'ATTACH', @level1type = N'TABLE', @level1name = N'Attachments', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Attachment', @level0type = N'SCHEMA', @level0name = N'ATTACH', @level1type = N'TABLE', @level1name = N'Attachments', @level2type = N'COLUMN', @level2name = N'CreatedAt';

