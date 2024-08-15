CREATE TABLE [ATTACH].[AttachmentTypes] (
    [Code]              INT                                                NOT NULL,
    [Name]              NVARCHAR (100)                                     NOT NULL,
    [NameAr]            NVARCHAR (100)                                     NOT NULL,
    [MaxFileCount]      INT                                                NULL,
    [MinFileCount]      INT                                                NULL,
    [ValidTo]           DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom]         DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    [CreatedAt]         DATETIME2 (7)                                      DEFAULT (getdate()) NOT NULL,
    [UpdatedBy]         INT                                                NULL,
    [UpdatedAt]         DATETIME2 (7)                                      DEFAULT (getdate()) NULL,
    [AllowedExtensions] NVARCHAR (MAX)                                     NULL,
    CONSTRAINT [PK_AttachmentTypes] PRIMARY KEY CLUSTERED ([Code] ASC),
    CONSTRAINT [FK_AttachmentTypes_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id]),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[ATTACH].[AttachmentTypesHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [IX_AttachmentTypes_UpdatedBy]
    ON [ATTACH].[AttachmentTypes]([UpdatedBy] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_AttachmentTypes_NameAr]
    ON [ATTACH].[AttachmentTypes]([NameAr] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_AttachmentTypes_Name]
    ON [ATTACH].[AttachmentTypes]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Attachment Type', @level0type = N'SCHEMA', @level0name = N'ATTACH', @level1type = N'TABLE', @level1name = N'AttachmentTypes', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Attachment Type', @level0type = N'SCHEMA', @level0name = N'ATTACH', @level1type = N'TABLE', @level1name = N'AttachmentTypes', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Attachment Type', @level0type = N'SCHEMA', @level0name = N'ATTACH', @level1type = N'TABLE', @level1name = N'AttachmentTypes', @level2type = N'COLUMN', @level2name = N'CreatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of Attachment Type', @level0type = N'SCHEMA', @level0name = N'ATTACH', @level1type = N'TABLE', @level1name = N'AttachmentTypes', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of Attachment Type', @level0type = N'SCHEMA', @level0name = N'ATTACH', @level1type = N'TABLE', @level1name = N'AttachmentTypes', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code => Code of Attachment Type', @level0type = N'SCHEMA', @level0name = N'ATTACH', @level1type = N'TABLE', @level1name = N'AttachmentTypes', @level2type = N'COLUMN', @level2name = N'Code';

