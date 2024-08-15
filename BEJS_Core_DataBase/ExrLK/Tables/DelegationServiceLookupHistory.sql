CREATE TABLE [ExrLK].[DelegationServiceLookupHistory] (
    [Code]      INT              NOT NULL,
    [Name]      NVARCHAR (200)   NOT NULL,
    [NameAr]    NVARCHAR (200)   NOT NULL,
    [ServiceId] UNIQUEIDENTIFIER NOT NULL,
    [IsActive]  BIT              NOT NULL,
    [ValidTo]   DATETIME2 (7)    NOT NULL,
    [ValidFrom] DATETIME2 (7)    NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_DelegationServiceLookupHistory]
    ON [ExrLK].[DelegationServiceLookupHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

