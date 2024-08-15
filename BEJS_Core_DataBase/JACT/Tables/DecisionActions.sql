CREATE TABLE [JACT].[DecisionActions] (
    [Id]                                      INT            IDENTITY (1, 1) NOT NULL,
    [Decision]                                NVARCHAR (MAX) NOT NULL,
    [IsTotalLeave]                            BIT            NULL,
    [TimeLimitSuspensionDate]                 DATE           NULL,
    [TimeLimitSuspensionDateHijri]            DECIMAL (8)    NULL,
    [TimeLimitSuspensionApplicantDefendantId] INT            NULL,
    CONSTRAINT [PK_DecisionActions] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_DecisionActions_ApplicantDefendants_TimeLimitSuspensionApplicantDefendantId] FOREIGN KEY ([TimeLimitSuspensionApplicantDefendantId]) REFERENCES [JACT].[ApplicantDefendants] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_DecisionActions_TimeLimitSuspensionApplicantDefendantId]
    ON [JACT].[DecisionActions]([TimeLimitSuspensionApplicantDefendantId] ASC);

