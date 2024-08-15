CREATE TABLE [cap].[Published] (
    [Id]         BIGINT         NOT NULL,
    [Version]    NVARCHAR (20)  NOT NULL,
    [Name]       NVARCHAR (200) NOT NULL,
    [Content]    NVARCHAR (MAX) NULL,
    [Retries]    INT            NOT NULL,
    [Added]      DATETIME2 (7)  NOT NULL,
    [ExpiresAt]  DATETIME2 (7)  NULL,
    [StatusName] NVARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_cap.Published] PRIMARY KEY CLUSTERED ([Id] ASC)
);

