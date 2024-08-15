CREATE TABLE [JACT].[GuidanceRejectionDecisionPlaintiff] (
    [Id]                          INT      IDENTITY (1, 1) NOT NULL,
    [IsExecutionRequestPlaintiff] BIT      NOT NULL,
    [DefendantId]                 INT      NULL,
    [DefendantTypeCode]           SMALLINT NULL,
    CONSTRAINT [PK_GuidanceRejectionDecisionPlaintiff] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_GuidanceRejectionDecisionPlaintiff_Types_DefendantTypeCode] FOREIGN KEY ([DefendantTypeCode]) REFERENCES [ExrLK].[Types] ([Code])
);


GO
CREATE NONCLUSTERED INDEX [IX_GuidanceRejectionDecisionPlaintiff_DefendantTypeCode]
    ON [JACT].[GuidanceRejectionDecisionPlaintiff]([DefendantTypeCode] ASC);

