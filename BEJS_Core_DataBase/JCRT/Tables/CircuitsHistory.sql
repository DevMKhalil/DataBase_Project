CREATE TABLE [JCRT].[CircuitsHistory] (
    [Id]            INT            NOT NULL,
    [Name]          NVARCHAR (200) NOT NULL,
    [CourtId]       INT            NOT NULL,
    [Specialties]   NVARCHAR (MAX) NOT NULL,
    [ValidTo]       DATETIME2 (7)  NOT NULL,
    [ValidFrom]     DATETIME2 (7)  NOT NULL,
    [CreatedAt]     DATETIME2 (7)  NOT NULL,
    [CreatedById]   INT            NOT NULL,
    [UpdatedAt]     DATETIME2 (7)  NULL,
    [UpdatedBy]     INT            NULL,
    [IsDeleted]     BIT            NOT NULL,
    [DeletedAt]     DATETIME2 (7)  NULL,
    [DeletedBy]     INT            NULL,
    [GeoLocationId] INT            NULL
);


GO
CREATE CLUSTERED INDEX [ix_CircuitsHistory]
    ON [JCRT].[CircuitsHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

