CREATE TABLE [SECR].[SecondaryRequestRejectReasons] (
    [Id]          INT             IDENTITY (1, 1) NOT NULL,
    [ReasonText]  NVARCHAR (2000) NOT NULL,
    [CreatedAt]   DATETIME2 (7)   DEFAULT (getdate()) NOT NULL,
    [CreatedById] INT             NOT NULL,
    [UpdatedAt]   DATETIME2 (7)   DEFAULT (getdate()) NULL,
    [UpdatedBy]   INT             NULL,
    CONSTRAINT [PK_SecondaryRequestRejectReasons] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SecondaryRequestRejectReasons_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_SecondaryRequestRejectReasons_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_SecondaryRequestRejectReasons_UpdatedBy]
    ON [SECR].[SecondaryRequestRejectReasons]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SecondaryRequestRejectReasons_CreatedById]
    ON [SECR].[SecondaryRequestRejectReasons]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Secondary Request Reject Reason', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'SecondaryRequestRejectReasons', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Secondary Request Reject Reason', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'SecondaryRequestRejectReasons', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Secondary Request Reject Reason', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'SecondaryRequestRejectReasons', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Secondary Request Reject Reason', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'SecondaryRequestRejectReasons', @level2type = N'COLUMN', @level2name = N'CreatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Reason Text => it is used for the reject reason entered by the judge', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'SecondaryRequestRejectReasons', @level2type = N'COLUMN', @level2name = N'ReasonText';

