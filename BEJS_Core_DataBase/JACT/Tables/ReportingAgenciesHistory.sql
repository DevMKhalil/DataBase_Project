CREATE TABLE [JACT].[ReportingAgenciesHistory] (
    [Code]        SMALLINT      NOT NULL,
    [ActionCode]  SMALLINT      NOT NULL,
    [TypeCode]    SMALLINT      NOT NULL,
    [GovAgencyId] INT           NOT NULL,
    [ValidTo]     DATETIME2 (7) NOT NULL,
    [ValidFrom]   DATETIME2 (7) NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_ReportingAgenciesHistory]
    ON [JACT].[ReportingAgenciesHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

