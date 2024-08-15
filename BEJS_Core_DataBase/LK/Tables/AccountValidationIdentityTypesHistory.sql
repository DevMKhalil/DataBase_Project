CREATE TABLE [LK].[AccountValidationIdentityTypesHistory] (
    [Id]        INT            NOT NULL,
    [Name]      NVARCHAR (500) NOT NULL,
    [NameAr]    NVARCHAR (500) NOT NULL,
    [IsActive]  BIT            NOT NULL,
    [Code]      NVARCHAR (MAX) NULL,
    [ValidTo]   DATETIME2 (7)  NOT NULL,
    [ValidFrom] DATETIME2 (7)  NOT NULL,
    [CreatedAt] DATETIME2 (7)  NOT NULL,
    [UpdatedAt] DATETIME2 (7)  NULL
);


GO
CREATE CLUSTERED INDEX [ix_AccountValidationIdentityTypesHistory]
    ON [LK].[AccountValidationIdentityTypesHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

