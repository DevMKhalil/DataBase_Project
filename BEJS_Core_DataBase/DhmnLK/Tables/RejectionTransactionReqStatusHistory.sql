CREATE TABLE [DhmnLK].[RejectionTransactionReqStatusHistory] (
    [Id]          INT            NOT NULL,
    [Name]        NVARCHAR (200) NULL,
    [NameAr]      NVARCHAR (200) NOT NULL,
    [Description] NVARCHAR (200) NULL,
    [IsActive]    BIT            NOT NULL,
    [CreatedAt]   DATETIME2 (7)  NOT NULL,
    [UpdatedAt]   DATETIME2 (7)  NULL,
    [ValidTo]     DATETIME2 (7)  NOT NULL,
    [ValidFrom]   DATETIME2 (7)  NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_RejectionTransactionReqStatusHistory]
    ON [DhmnLK].[RejectionTransactionReqStatusHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

