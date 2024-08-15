CREATE TABLE [ATTACH].[AttachmentTypesHistory] (
    [Code]              INT            NOT NULL,
    [Name]              NVARCHAR (100) NOT NULL,
    [NameAr]            NVARCHAR (100) NOT NULL,
    [MaxFileCount]      INT            NULL,
    [MinFileCount]      INT            NULL,
    [ValidTo]           DATETIME2 (7)  NOT NULL,
    [ValidFrom]         DATETIME2 (7)  NOT NULL,
    [CreatedAt]         DATETIME2 (7)  NOT NULL,
    [UpdatedBy]         INT            NULL,
    [UpdatedAt]         DATETIME2 (7)  NULL,
    [AllowedExtensions] NVARCHAR (MAX) NULL
);


GO
CREATE CLUSTERED INDEX [ix_AttachmentTypesHistory]
    ON [ATTACH].[AttachmentTypesHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

