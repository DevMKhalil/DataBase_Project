CREATE TABLE [GOV].[AgenciesHistory] (
    [Id]             INT            NOT NULL,
    [Name]           NVARCHAR (200) NULL,
    [NameAr]         NVARCHAR (200) NOT NULL,
    [FullName]       NVARCHAR (200) NOT NULL,
    [AgencyId]       INT            NOT NULL,
    [Mobile]         NVARCHAR (MAX) NULL,
    [Email]          NVARCHAR (MAX) NULL,
    [ParentAgencyId] INT            NULL,
    [OriginalData]   NVARCHAR (MAX) NOT NULL,
    [IsActive]       BIT            NOT NULL,
    [CreatedAt]      DATETIME2 (7)  NOT NULL,
    [UpdatedAt]      DATETIME2 (7)  NULL,
    [ValidTo]        DATETIME2 (7)  NOT NULL,
    [ValidFrom]      DATETIME2 (7)  NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_AgenciesHistory]
    ON [GOV].[AgenciesHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

