CREATE TABLE [MOI].[MOIDelegatesHistory] (
    [Id]                       INT           NOT NULL,
    [UserAccountId]            INT           NOT NULL,
    [StatusCode]               SMALLINT      NOT NULL,
    [DeactivateStartDate]      DATE          NULL,
    [DeactivateStartDateHijri] DECIMAL (8)   NULL,
    [ValidTo]                  DATETIME2 (7) NOT NULL,
    [ValidFrom]                DATETIME2 (7) NOT NULL,
    [DeactivateEndDate]        DATE          NULL,
    [DeactivateEndDateHijri]   DECIMAL (8)   NULL,
    [CreatedAt]                DATETIME2 (7) NOT NULL,
    [CreatedById]              INT           NOT NULL,
    [UpdatedAt]                DATETIME2 (7) NULL,
    [UpdatedBy]                INT           NULL
);


GO
CREATE CLUSTERED INDEX [ix_MOIDelegatesHistory]
    ON [MOI].[MOIDelegatesHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

