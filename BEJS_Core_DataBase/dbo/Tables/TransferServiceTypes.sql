CREATE TABLE [dbo].[TransferServiceTypes] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Code]        INT            NOT NULL,
    [Description] NVARCHAR (MAX) NULL,
    [Name]        NVARCHAR (MAX) NULL,
    [NameAr]      NVARCHAR (MAX) NULL,
    [CreatedAt]   DATETIME2 (7)  NOT NULL,
    [UpdatedAt]   DATETIME2 (7)  NULL,
    [IsActive]    BIT            NOT NULL,
    CONSTRAINT [PK_TransferServiceTypes] PRIMARY KEY CLUSTERED ([Id] ASC)
);

