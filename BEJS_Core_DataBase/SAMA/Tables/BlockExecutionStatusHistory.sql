﻿CREATE TABLE [SAMA].[BlockExecutionStatusHistory] (
    [Id]          INT            NOT NULL,
    [Name]        NVARCHAR (200) NULL,
    [NameAr]      NVARCHAR (200) NOT NULL,
    [StatusCode]  NVARCHAR (200) NULL,
    [Description] NVARCHAR (200) NULL,
    [IsActive]    BIT            NOT NULL,
    [CreatedAt]   DATETIME2 (7)  NOT NULL,
    [UpdatedAt]   DATETIME2 (7)  NULL,
    [ValidTo]     DATETIME2 (7)  NOT NULL,
    [ValidFrom]   DATETIME2 (7)  NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_BlockExecutionStatusHistory]
    ON [SAMA].[BlockExecutionStatusHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

