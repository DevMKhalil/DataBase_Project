CREATE TABLE [SecrLK].[SecondaryRequestStatusesForRole] (
    [StatusCode] SMALLINT      NOT NULL,
    [RoleCode]   INT           NOT NULL,
    [CreatedAt]  DATETIME2 (7) NOT NULL,
    [IsActive]   BIT           NOT NULL,
    CONSTRAINT [PK_SecondaryRequestStatusesForRole] PRIMARY KEY CLUSTERED ([RoleCode] ASC, [StatusCode] ASC),
    CONSTRAINT [FK_SecondaryRequestStatusesForRole_Roles_RoleCode] FOREIGN KEY ([RoleCode]) REFERENCES [AUTH].[Roles] ([Code]),
    CONSTRAINT [FK_SecondaryRequestStatusesForRole_SecondaryRequestStatuses_StatusCode] FOREIGN KEY ([StatusCode]) REFERENCES [SecrLK].[SecondaryRequestStatuses] ([Code])
);


GO
CREATE NONCLUSTERED INDEX [IX_SecondaryRequestStatusesForRole_StatusCode]
    ON [SecrLK].[SecondaryRequestStatusesForRole]([StatusCode] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Is Active => it is used to determine if status is active for associated role', @level0type = N'SCHEMA', @level0name = N'SecrLK', @level1type = N'TABLE', @level1name = N'SecondaryRequestStatusesForRole', @level2type = N'COLUMN', @level2name = N'IsActive';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Secondary Request Status For Role', @level0type = N'SCHEMA', @level0name = N'SecrLK', @level1type = N'TABLE', @level1name = N'SecondaryRequestStatusesForRole', @level2type = N'COLUMN', @level2name = N'CreatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Role Code => it is used to associate user role to a secondary request status', @level0type = N'SCHEMA', @level0name = N'SecrLK', @level1type = N'TABLE', @level1name = N'SecondaryRequestStatusesForRole', @level2type = N'COLUMN', @level2name = N'RoleCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Status Code => it is used to associate secondary request status to a user role', @level0type = N'SCHEMA', @level0name = N'SecrLK', @level1type = N'TABLE', @level1name = N'SecondaryRequestStatusesForRole', @level2type = N'COLUMN', @level2name = N'StatusCode';

