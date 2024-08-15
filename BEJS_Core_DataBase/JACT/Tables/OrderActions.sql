CREATE TABLE [JACT].[OrderActions] (
    [Id]                                      INT             IDENTITY (1, 1) NOT NULL,
    [OrderText]                               NVARCHAR (MAX)  NULL,
    [ExecutionWarningDecisionDate]            DATE            NULL,
    [ExecutionWarningDecisionDateHijri]       DECIMAL (8)     NULL,
    [TimeLimitSuspensionDate]                 DATE            NULL,
    [TimeLimitSuspensionDateHijri]            DECIMAL (8)     NULL,
    [ExecutionOrderForGovAgencyDate]          DATE            NULL,
    [ExecutionOrderForGovAgencyDateHijri]     DECIMAL (8)     NULL,
    [TimeLimitSuspensionApplicantDefendantId] INT             NULL,
    [InvoiceId]                               INT             NULL,
    [IsSolidarity]                            BIT             NULL,
    [TotalAmount]                             DECIMAL (18, 2) NULL,
    CONSTRAINT [PK_OrderActions] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_OrderActions_ApplicantDefendants_TimeLimitSuspensionApplicantDefendantId] FOREIGN KEY ([TimeLimitSuspensionApplicantDefendantId]) REFERENCES [JACT].[ApplicantDefendants] ([Id]),
    CONSTRAINT [FK_OrderActions_Invoices_InvoiceId] FOREIGN KEY ([InvoiceId]) REFERENCES [NVOC].[Invoices] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_OrderActions_InvoiceId]
    ON [JACT].[OrderActions]([InvoiceId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_OrderActions_TimeLimitSuspensionApplicantDefendantId]
    ON [JACT].[OrderActions]([TimeLimitSuspensionApplicantDefendantId] ASC);

