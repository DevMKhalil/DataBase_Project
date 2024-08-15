CREATE TABLE [JactSuspOrder].[NicRemarks] (
    [Id]              INT            IDENTITY (1, 1) NOT NULL,
    [NicDetailsId]    INT            NOT NULL,
    [SequenceNumber]  INT            NULL,
    [NotesCreateDate] DATETIME2 (7)  NULL,
    [OperatorId]      FLOAT (53)     NULL,
    [Remark]          NVARCHAR (MAX) NULL,
    [CreatedAt]       DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    [CreatedById]     INT            NOT NULL,
    [UpdatedAt]       DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [UpdatedBy]       INT            NULL,
    CONSTRAINT [PK_NicRemarks] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_NicRemarks_NicDetails_NicDetailsId] FOREIGN KEY ([NicDetailsId]) REFERENCES [JactSuspOrder].[NicDetails] ([Id]),
    CONSTRAINT [FK_NicRemarks_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_NicRemarks_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_NicRemarks_UpdatedBy]
    ON [JactSuspOrder].[NicRemarks]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_NicRemarks_NicDetailsId]
    ON [JactSuspOrder].[NicRemarks]([NicDetailsId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_NicRemarks_CreatedById]
    ON [JactSuspOrder].[NicRemarks]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Suspension Order Defendant Nic Remark', @level0type = N'SCHEMA', @level0name = N'JactSuspOrder', @level1type = N'TABLE', @level1name = N'NicRemarks', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Suspension Order Defendant Nic Remark', @level0type = N'SCHEMA', @level0name = N'JactSuspOrder', @level1type = N'TABLE', @level1name = N'NicRemarks', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Suspension Order Defendant Nic Remark', @level0type = N'SCHEMA', @level0name = N'JactSuspOrder', @level1type = N'TABLE', @level1name = N'NicRemarks', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Suspension Order Defendant Nic Remark', @level0type = N'SCHEMA', @level0name = N'JactSuspOrder', @level1type = N'TABLE', @level1name = N'NicRemarks', @level2type = N'COLUMN', @level2name = N'CreatedAt';

