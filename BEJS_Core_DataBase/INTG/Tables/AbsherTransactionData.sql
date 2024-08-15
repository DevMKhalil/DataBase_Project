CREATE TABLE [INTG].[AbsherTransactionData] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [CitizenData]  NVARCHAR (2000)  NULL,
    [ResidentData] NVARCHAR (2000)  NULL,
    [CreatedAt]    DATETIME2 (7)    DEFAULT (getdate()) NOT NULL,
    [CreatedById]  INT              NOT NULL,
    CONSTRAINT [PK_AbsherTransactionData] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_AbsherTransactionData_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_AbsherTransactionData_CreatedById]
    ON [INTG].[AbsherTransactionData]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Absher Transaction Data', @level0type = N'SCHEMA', @level0name = N'INTG', @level1type = N'TABLE', @level1name = N'AbsherTransactionData', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Absher Transaction Data', @level0type = N'SCHEMA', @level0name = N'INTG', @level1type = N'TABLE', @level1name = N'AbsherTransactionData', @level2type = N'COLUMN', @level2name = N'CreatedAt';

