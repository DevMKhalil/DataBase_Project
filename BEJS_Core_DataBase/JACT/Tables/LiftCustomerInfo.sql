CREATE TABLE [JACT].[LiftCustomerInfo] (
    [Id]             INT            IDENTITY (1, 1) NOT NULL,
    [Name]           NVARCHAR (MAX) NULL,
    [CustomerId]     NVARCHAR (MAX) NULL,
    [IdentityTypeId] INT            NULL,
    CONSTRAINT [PK_LiftCustomerInfo] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_LiftCustomerInfo_IdTypes_IdentityTypeId] FOREIGN KEY ([IdentityTypeId]) REFERENCES [SAMA].[IdTypes] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_LiftCustomerInfo_IdentityTypeId]
    ON [JACT].[LiftCustomerInfo]([IdentityTypeId] ASC);

