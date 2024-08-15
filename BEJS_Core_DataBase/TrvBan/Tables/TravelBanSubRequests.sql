CREATE TABLE [TrvBan].[TravelBanSubRequests] (
    [Id]                    BIGINT        IDENTITY (1, 1) NOT NULL,
    [SubRequestNumber]      NVARCHAR (50) NOT NULL,
    [DefendantId]           INT           NOT NULL,
    [StatusCode]            INT           NOT NULL,
    [TravelBanRequestId]    INT           NOT NULL,
    [SubmittedAt]           DATETIME2 (7) NULL,
    [SubmittedByDelegateId] INT           NULL,
    [ReferenceNumber]       NVARCHAR (50) NULL,
    CONSTRAINT [PK_TravelBanSubRequests] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_TravelBanSubRequests_Defendants_DefendantId] FOREIGN KEY ([DefendantId]) REFERENCES [JACT].[Defendants] ([Id]),
    CONSTRAINT [FK_TravelBanSubRequests_MOIDelegates_SubmittedByDelegateId] FOREIGN KEY ([SubmittedByDelegateId]) REFERENCES [MOI].[MOIDelegates] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_TravelBanSubRequests_TravelBanRequests_TravelBanRequestId] FOREIGN KEY ([TravelBanRequestId]) REFERENCES [TrvBan].[TravelBanRequests] ([Id]),
    CONSTRAINT [FK_TravelBanSubRequests_TravelBanSubRequestStatus_StatusCode] FOREIGN KEY ([StatusCode]) REFERENCES [TrvBan].[TravelBanSubRequestStatus] ([Code])
);


GO
CREATE NONCLUSTERED INDEX [IX_TravelBanSubRequests_TravelBanRequestId]
    ON [TrvBan].[TravelBanSubRequests]([TravelBanRequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TravelBanSubRequests_SubmittedByDelegateId]
    ON [TrvBan].[TravelBanSubRequests]([SubmittedByDelegateId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TravelBanSubRequests_StatusCode]
    ON [TrvBan].[TravelBanSubRequests]([StatusCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TravelBanSubRequests_DefendantId]
    ON [TrvBan].[TravelBanSubRequests]([DefendantId] ASC);

