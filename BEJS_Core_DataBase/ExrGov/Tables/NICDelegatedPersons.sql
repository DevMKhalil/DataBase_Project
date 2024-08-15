CREATE TABLE [ExrGov].[NICDelegatedPersons] (
    [Id]              BIGINT         IDENTITY (1, 1) NOT NULL,
    [IdentityNumber]  BIGINT         NOT NULL,
    [FullNameArabic]  NVARCHAR (MAX) NULL,
    [FullNameEnglish] NVARCHAR (MAX) NULL,
    [BirthDate]       DATE           NULL,
    [BirthDateHijri]  DECIMAL (8)    NULL,
    [Mobile]          NVARCHAR (12)  NOT NULL,
    [Email]           NVARCHAR (50)  NOT NULL,
    [CreatedAt]       DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    [CreatedById]     INT            NOT NULL,
    [UpdatedAt]       DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [UpdatedBy]       INT            NULL,
    CONSTRAINT [PK_NICDelegatedPersons] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_NICDelegatedPersons_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_NICDelegatedPersons_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_NICDelegatedPersons_IdentityNumber]
    ON [ExrGov].[NICDelegatedPersons]([IdentityNumber] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_NICDelegatedPersons_UpdatedBy]
    ON [ExrGov].[NICDelegatedPersons]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_NICDelegatedPersons_CreatedById]
    ON [ExrGov].[NICDelegatedPersons]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update N I C Delegated Person', @level0type = N'SCHEMA', @level0name = N'ExrGov', @level1type = N'TABLE', @level1name = N'NICDelegatedPersons', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of N I C Delegated Person', @level0type = N'SCHEMA', @level0name = N'ExrGov', @level1type = N'TABLE', @level1name = N'NICDelegatedPersons', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create N I C Delegated Person', @level0type = N'SCHEMA', @level0name = N'ExrGov', @level1type = N'TABLE', @level1name = N'NICDelegatedPersons', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of N I C Delegated Person', @level0type = N'SCHEMA', @level0name = N'ExrGov', @level1type = N'TABLE', @level1name = N'NICDelegatedPersons', @level2type = N'COLUMN', @level2name = N'CreatedAt';

