CREATE TABLE [ATTACH].[FileStatus] (
    [Code]      INT                                                NOT NULL,
    [Name]      NVARCHAR (100)                                     NOT NULL,
    [NameAr]    NVARCHAR (100)                                     NOT NULL,
    [ValidTo]   DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom] DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    [CreatedAt] DATETIME2 (7)                                      DEFAULT (getdate()) NOT NULL,
    [UpdatedBy] INT                                                NULL,
    [UpdatedAt] DATETIME2 (7)                                      DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_FileStatus] PRIMARY KEY CLUSTERED ([Code] ASC),
    CONSTRAINT [FK_FileStatus_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id]),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[ATTACH].[FileStatusHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [IX_FileStatus_UpdatedBy]
    ON [ATTACH].[FileStatus]([UpdatedBy] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_FileStatus_NameAr]
    ON [ATTACH].[FileStatus]([NameAr] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_FileStatus_Name]
    ON [ATTACH].[FileStatus]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of File Status', @level0type = N'SCHEMA', @level0name = N'ATTACH', @level1type = N'TABLE', @level1name = N'FileStatus', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update File Status', @level0type = N'SCHEMA', @level0name = N'ATTACH', @level1type = N'TABLE', @level1name = N'FileStatus', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of File Status', @level0type = N'SCHEMA', @level0name = N'ATTACH', @level1type = N'TABLE', @level1name = N'FileStatus', @level2type = N'COLUMN', @level2name = N'CreatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of File Status', @level0type = N'SCHEMA', @level0name = N'ATTACH', @level1type = N'TABLE', @level1name = N'FileStatus', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of File Status', @level0type = N'SCHEMA', @level0name = N'ATTACH', @level1type = N'TABLE', @level1name = N'FileStatus', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code => Code of File Status', @level0type = N'SCHEMA', @level0name = N'ATTACH', @level1type = N'TABLE', @level1name = N'FileStatus', @level2type = N'COLUMN', @level2name = N'Code';

