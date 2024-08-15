CREATE TABLE [Court].[CourtMembersHistory] (
    [Id]                       INT           NOT NULL,
    [UserAccountId]            INT           NOT NULL,
    [StatusCode]               SMALLINT      NOT NULL,
    [DelegationStartDate]      DATE          NULL,
    [DelegationStartDateHijri] DECIMAL (8)   NULL,
    [ValidTo]                  DATETIME2 (7) NOT NULL,
    [ValidFrom]                DATETIME2 (7) NOT NULL,
    [DelegationEndDate]        DATE          NULL,
    [DelegationEndDateHijri]   DECIMAL (8)   NULL,
    [CreatedAt]                DATETIME2 (7) NOT NULL,
    [CreatedById]              INT           NOT NULL,
    [UpdatedAt]                DATETIME2 (7) NULL,
    [UpdatedBy]                INT           NULL,
    [PermissionCode]           SMALLINT      NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_CourtMembersHistory]
    ON [Court].[CourtMembersHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

