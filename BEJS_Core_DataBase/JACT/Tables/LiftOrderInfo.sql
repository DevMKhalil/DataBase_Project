CREATE TABLE [JACT].[LiftOrderInfo] (
    [Id]                     INT             IDENTITY (1, 1) NOT NULL,
    [FinancialInstituteId]   INT             NOT NULL,
    [DefendantLiftId]        INT             NOT NULL,
    [LiftCustomerInfoId]     INT             NULL,
    [ExecutionDatetime]      DATE            NOT NULL,
    [ExecutionDatetimeHijri] DECIMAL (8)     NULL,
    [FIResponseStatusId]     INT             DEFAULT ((0)) NOT NULL,
    [SummeryInfoBlockAmount] DECIMAL (18, 2) NULL,
    [SummeryInfoTotalAmount] DECIMAL (18, 2) NULL,
    CONSTRAINT [PK_LiftOrderInfo] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_LiftOrderInfo_DefendantLifts_DefendantLiftId] FOREIGN KEY ([DefendantLiftId]) REFERENCES [JACT].[DefendantLifts] ([Id]),
    CONSTRAINT [FK_LiftOrderInfo_FinancialInstitutes_FinancialInstituteId] FOREIGN KEY ([FinancialInstituteId]) REFERENCES [SAMA].[FinancialInstitutes] ([Id]),
    CONSTRAINT [FK_LiftOrderInfo_LiftCustomerInfo_LiftCustomerInfoId] FOREIGN KEY ([LiftCustomerInfoId]) REFERENCES [JACT].[LiftCustomerInfo] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_LiftOrderInfo_ResponseStatusCodes_FIResponseStatusId] FOREIGN KEY ([FIResponseStatusId]) REFERENCES [SAMA].[ResponseStatusCodes] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_LiftOrderInfo_FIResponseStatusId]
    ON [JACT].[LiftOrderInfo]([FIResponseStatusId] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_LiftOrderInfo_LiftCustomerInfoId]
    ON [JACT].[LiftOrderInfo]([LiftCustomerInfoId] ASC) WHERE ([LiftCustomerInfoId] IS NOT NULL);


GO
CREATE NONCLUSTERED INDEX [IX_LiftOrderInfo_FinancialInstituteId]
    ON [JACT].[LiftOrderInfo]([FinancialInstituteId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_LiftOrderInfo_DefendantLiftId]
    ON [JACT].[LiftOrderInfo]([DefendantLiftId] ASC);

