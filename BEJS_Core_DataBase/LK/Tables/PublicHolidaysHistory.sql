CREATE TABLE [LK].[PublicHolidaysHistory] (
    [Id]        SMALLINT       NOT NULL,
    [Name]      NVARCHAR (100) NOT NULL,
    [NameAr]    NVARCHAR (100) NOT NULL,
    [From]      DECIMAL (8)    NOT NULL,
    [To]        DECIMAL (8)    NOT NULL,
    [Year]      SMALLINT       NOT NULL,
    [ValidTo]   DATETIME2 (7)  NOT NULL,
    [ValidFrom] DATETIME2 (7)  NOT NULL,
    [CreatedAt] DATETIME2 (7)  NOT NULL,
    [UpdatedAt] DATETIME2 (7)  NULL
);


GO
CREATE CLUSTERED INDEX [ix_PublicHolidaysHistory]
    ON [LK].[PublicHolidaysHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

