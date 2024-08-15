CREATE TABLE [EXR].[SelfServiceRequestingAgenciesHistory] (
    [Id]          INT           NOT NULL,
    [GovAgencyId] INT           NOT NULL,
    [ValidTo]     DATETIME2 (7) NOT NULL,
    [ValidFrom]   DATETIME2 (7) NOT NULL,
    [CreatedAt]   DATETIME2 (7) NOT NULL,
    [CreatedById] INT           NOT NULL,
    [UpdatedAt]   DATETIME2 (7) NULL,
    [UpdatedBy]   INT           NULL
);


GO
CREATE CLUSTERED INDEX [ix_SelfServiceRequestingAgenciesHistory]
    ON [EXR].[SelfServiceRequestingAgenciesHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

