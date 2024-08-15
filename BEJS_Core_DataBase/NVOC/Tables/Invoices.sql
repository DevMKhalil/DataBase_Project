CREATE TABLE [NVOC].[Invoices] (
    [Id]          INT             IDENTITY (1, 1) NOT NULL,
    [Number]      BIGINT          NOT NULL,
    [TotalAmount] DECIMAL (18, 2) NOT NULL,
    [StatusId]    INT             NOT NULL,
    [IssueDate]   DATETIME2 (7)   NOT NULL,
    [CreatedAt]   DATETIME2 (7)   DEFAULT (getdate()) NOT NULL,
    [CreatedById] INT             NOT NULL,
    [UpdatedAt]   DATETIME2 (7)   DEFAULT (getdate()) NULL,
    [UpdatedBy]   INT             NULL,
    CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Invoices_InvoiceStatus_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [LK].[InvoiceStatus] ([Id]),
    CONSTRAINT [FK_Invoices_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_Invoices_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Invoices_UpdatedBy]
    ON [NVOC].[Invoices]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Invoices_StatusId]
    ON [NVOC].[Invoices]([StatusId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Invoices_CreatedById]
    ON [NVOC].[Invoices]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Invoice', @level0type = N'SCHEMA', @level0name = N'NVOC', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Invoice', @level0type = N'SCHEMA', @level0name = N'NVOC', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Invoice', @level0type = N'SCHEMA', @level0name = N'NVOC', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Invoice', @level0type = N'SCHEMA', @level0name = N'NVOC', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'COLUMN', @level2name = N'CreatedAt';

