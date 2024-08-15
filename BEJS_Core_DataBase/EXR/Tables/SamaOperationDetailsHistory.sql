CREATE TABLE [EXR].[SamaOperationDetailsHistory] (
    [Id]                        INT           NOT NULL,
    [EnforcementId]             INT           NULL,
    [SamaValidationOperationId] BIGINT        NOT NULL,
    [StatusId]                  SMALLINT      NOT NULL,
    [ValidTo]                   DATETIME2 (7) NOT NULL,
    [ValidFrom]                 DATETIME2 (7) NOT NULL,
    [CreatedAt]                 DATETIME2 (7) NOT NULL,
    [CreatedById]               INT           NOT NULL,
    [UpdatedAt]                 DATETIME2 (7) NULL,
    [UpdatedBy]                 INT           NULL,
    [RequestTempId]             INT           NULL
);


GO
CREATE CLUSTERED INDEX [ix_SamaOperationDetailsHistory]
    ON [EXR].[SamaOperationDetailsHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

