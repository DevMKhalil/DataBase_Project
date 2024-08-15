CREATE TABLE [SECR].[SuspensionRequestsHistory] (
    [Id]                        INT            NOT NULL,
    [SecondaryRequestId]        INT            NOT NULL,
    [Reasons]                   NVARCHAR (MAX) NOT NULL,
    [ProceduresStatement]       NVARCHAR (MAX) NOT NULL,
    [TimeLimitRequired]         NVARCHAR (MAX) NULL,
    [StartDate]                 DATE           NULL,
    [StartDateHijri]            DECIMAL (8)    NULL,
    [ValidTo]                   DATETIME2 (7)  NOT NULL,
    [ValidFrom]                 DATETIME2 (7)  NOT NULL,
    [EndDate]                   DATE           NULL,
    [EndDateHijri]              DECIMAL (8)    NULL,
    [IsPlaintiff]               BIT            NOT NULL,
    [JudicialActionDefendantId] INT            NULL,
    [SuspensionParentId]        INT            NULL,
    [CreatedAt]                 DATETIME2 (7)  NOT NULL,
    [CreatedById]               INT            NOT NULL,
    [UpdatedAt]                 DATETIME2 (7)  NULL,
    [UpdatedBy]                 INT            NULL,
    [SuspensionRequestId]       INT            NULL
);


GO
CREATE CLUSTERED INDEX [ix_SuspensionRequestsHistory]
    ON [SECR].[SuspensionRequestsHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

