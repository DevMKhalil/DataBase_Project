CREATE TABLE [JCRT].[CircuitMembers] (
    [Id]                   INT                                                IDENTITY (1, 1) NOT NULL,
    [MemberId]             INT                                                NOT NULL,
    [JudicialCircuitId]    INT                                                NOT NULL,
    [TypeCode]             SMALLINT                                           NOT NULL,
    [IsActive]             BIT                                                NOT NULL,
    [DelegationStart]      DATE                                               NULL,
    [DelegationStartHijri] DECIMAL (8)                                        NULL,
    [ValidTo]              DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom]            DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    [DelegationEnd]        DATE                                               NULL,
    [DelegationEndHijri]   DECIMAL (8)                                        NULL,
    [CreatedAt]            DATETIME2 (7)                                      DEFAULT (getdate()) NOT NULL,
    [CreatedById]          INT                                                NOT NULL,
    [UpdatedAt]            DATETIME2 (7)                                      DEFAULT (getdate()) NULL,
    [UpdatedBy]            INT                                                NULL,
    CONSTRAINT [PK_CircuitMembers] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_CircuitMembers_CircuitMemberTypes_TypeCode] FOREIGN KEY ([TypeCode]) REFERENCES [JCRT].[CircuitMemberTypes] ([Code]),
    CONSTRAINT [FK_CircuitMembers_Circuits_JudicialCircuitId] FOREIGN KEY ([JudicialCircuitId]) REFERENCES [JCRT].[Circuits] ([Id]),
    CONSTRAINT [FK_CircuitMembers_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_CircuitMembers_Users_MemberId] FOREIGN KEY ([MemberId]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_CircuitMembers_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id]),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[JCRT].[CircuitMembersHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [IX_CircuitMembers_UpdatedBy]
    ON [JCRT].[CircuitMembers]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CircuitMembers_TypeCode]
    ON [JCRT].[CircuitMembers]([TypeCode] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_CircuitMembers_MemberId_JudicialCircuitId]
    ON [JCRT].[CircuitMembers]([MemberId] ASC, [JudicialCircuitId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CircuitMembers_JudicialCircuitId]
    ON [JCRT].[CircuitMembers]([JudicialCircuitId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CircuitMembers_CreatedById]
    ON [JCRT].[CircuitMembers]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Judicial Circuit Member', @level0type = N'SCHEMA', @level0name = N'JCRT', @level1type = N'TABLE', @level1name = N'CircuitMembers', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Judicial Circuit Member', @level0type = N'SCHEMA', @level0name = N'JCRT', @level1type = N'TABLE', @level1name = N'CircuitMembers', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Judicial Circuit Member', @level0type = N'SCHEMA', @level0name = N'JCRT', @level1type = N'TABLE', @level1name = N'CircuitMembers', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Judicial Circuit Member', @level0type = N'SCHEMA', @level0name = N'JCRT', @level1type = N'TABLE', @level1name = N'CircuitMembers', @level2type = N'COLUMN', @level2name = N'CreatedAt';

