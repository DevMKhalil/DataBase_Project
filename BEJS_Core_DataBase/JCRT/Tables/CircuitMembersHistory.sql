CREATE TABLE [JCRT].[CircuitMembersHistory] (
    [Id]                   INT           NOT NULL,
    [MemberId]             INT           NOT NULL,
    [JudicialCircuitId]    INT           NOT NULL,
    [TypeCode]             SMALLINT      NOT NULL,
    [IsActive]             BIT           NOT NULL,
    [DelegationStart]      DATE          NULL,
    [DelegationStartHijri] DECIMAL (8)   NULL,
    [ValidTo]              DATETIME2 (7) NOT NULL,
    [ValidFrom]            DATETIME2 (7) NOT NULL,
    [DelegationEnd]        DATE          NULL,
    [DelegationEndHijri]   DECIMAL (8)   NULL,
    [CreatedAt]            DATETIME2 (7) NOT NULL,
    [CreatedById]          INT           NOT NULL,
    [UpdatedAt]            DATETIME2 (7) NULL,
    [UpdatedBy]            INT           NULL
);


GO
CREATE CLUSTERED INDEX [ix_CircuitMembersHistory]
    ON [JCRT].[CircuitMembersHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

