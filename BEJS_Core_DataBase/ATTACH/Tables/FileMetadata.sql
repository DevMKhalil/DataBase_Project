CREATE TABLE [ATTACH].[FileMetadata] (
    [Id]           BIGINT           IDENTITY (1, 1) NOT NULL,
    [AttachmentId] BIGINT           NOT NULL,
    [ReferenceId]  UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (255)   NULL,
    [Extension]    NVARCHAR (10)    NOT NULL,
    [Path]         NVARCHAR (1000)  NOT NULL,
    [SizeInBytes]  BIGINT           NOT NULL,
    [ContentType]  NVARCHAR (50)    NULL,
    [StatusCode]   INT              NOT NULL,
    [CreatedAt]    DATETIME2 (7)    DEFAULT (getdate()) NOT NULL,
    [CreatedById]  INT              NOT NULL,
    [UpdatedAt]    DATETIME2 (7)    DEFAULT (getdate()) NULL,
    [UpdatedBy]    INT              NULL,
    CONSTRAINT [PK_FileMetadata] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_FileMetadata_Attachments_AttachmentId] FOREIGN KEY ([AttachmentId]) REFERENCES [ATTACH].[Attachments] ([Id]),
    CONSTRAINT [FK_FileMetadata_FileStatus_StatusCode] FOREIGN KEY ([StatusCode]) REFERENCES [ATTACH].[FileStatus] ([Code]),
    CONSTRAINT [FK_FileMetadata_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_FileMetadata_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_FileMetadata_UpdatedBy]
    ON [ATTACH].[FileMetadata]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FileMetadata_StatusCode]
    ON [ATTACH].[FileMetadata]([StatusCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FileMetadata_CreatedById]
    ON [ATTACH].[FileMetadata]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FileMetadata_AttachmentId]
    ON [ATTACH].[FileMetadata]([AttachmentId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update File Metadata', @level0type = N'SCHEMA', @level0name = N'ATTACH', @level1type = N'TABLE', @level1name = N'FileMetadata', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of File Metadata', @level0type = N'SCHEMA', @level0name = N'ATTACH', @level1type = N'TABLE', @level1name = N'FileMetadata', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create File Metadata', @level0type = N'SCHEMA', @level0name = N'ATTACH', @level1type = N'TABLE', @level1name = N'FileMetadata', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of File Metadata', @level0type = N'SCHEMA', @level0name = N'ATTACH', @level1type = N'TABLE', @level1name = N'FileMetadata', @level2type = N'COLUMN', @level2name = N'CreatedAt';

