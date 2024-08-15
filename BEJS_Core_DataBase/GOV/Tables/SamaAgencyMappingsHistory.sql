CREATE TABLE [GOV].[SamaAgencyMappingsHistory] (
    [Id]              INT           NOT NULL,
    [AgencyId]        INT           NOT NULL,
    [MappingAgencyId] INT           NOT NULL,
    [CreatedAt]       DATETIME2 (7) NOT NULL,
    [CreatedById]     INT           NOT NULL,
    [UpdatedAt]       DATETIME2 (7) NULL,
    [UpdatedBy]       INT           NULL,
    [ValidFrom]       DATETIME2 (7) NOT NULL,
    [ValidTo]         DATETIME2 (7) NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_SamaAgencyMappingsHistory]
    ON [GOV].[SamaAgencyMappingsHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

