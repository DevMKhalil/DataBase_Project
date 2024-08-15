CREATE TABLE [DhmnLK].[TransactionStatus] (
    [Id]        INT                                                IDENTITY (1, 1) NOT NULL,
    [Name]      NVARCHAR (200)                                     NULL,
    [NameAr]    NVARCHAR (200)                                     NOT NULL,
    [IsActive]  BIT                                                NOT NULL,
    [CreatedAt] DATETIME2 (7)                                      DEFAULT (getdate()) NOT NULL,
    [UpdatedAt] DATETIME2 (7)                                      NULL,
    [ValidTo]   DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom] DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    CONSTRAINT [PK_TransactionStatus] PRIMARY KEY CLUSTERED ([Id] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[DhmnLK].[TransactionStatusHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [IX_TransactionStatus_Name]
    ON [DhmnLK].[TransactionStatus]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Transaction Status', @level0type = N'SCHEMA', @level0name = N'DhmnLK', @level1type = N'TABLE', @level1name = N'TransactionStatus', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Transaction Status', @level0type = N'SCHEMA', @level0name = N'DhmnLK', @level1type = N'TABLE', @level1name = N'TransactionStatus', @level2type = N'COLUMN', @level2name = N'CreatedAt';

