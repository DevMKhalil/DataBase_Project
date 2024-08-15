CREATE TABLE [BOG].[Employees] (
    [Id]                INT            IDENTITY (1, 1) NOT NULL,
    [UserId]            INT            NOT NULL,
    [EmployeeNumber]    NVARCHAR (50)  NOT NULL,
    [EmployeeId]        INT            NOT NULL,
    [EmployeeName]      NVARCHAR (MAX) NULL,
    [DepartmentId]      INT            NULL,
    [DepartmentName]    NVARCHAR (MAX) NULL,
    [JobDepartmentId]   INT            NULL,
    [JobDepartmentName] NVARCHAR (MAX) NULL,
    [CategoryId]        INT            NULL,
    [CategoryName]      NVARCHAR (MAX) NULL,
    [RankId]            INT            NULL,
    [RankName]          NVARCHAR (MAX) NULL,
    [JobNo]             INT            NULL,
    [JobTitleName]      NVARCHAR (MAX) NULL,
    [BirthDate]         DATE           NULL,
    [JoinDate]          DATE           NULL,
    [TerminationDate]   DATE           NULL,
    [FeqhGradeValue]    DECIMAL (3, 2) NULL,
    [OsoulGradeValue]   DECIMAL (3, 2) NULL,
    [TypeCode]          SMALLINT       NOT NULL,
    [CreatedAt]         DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    [CreatedById]       INT            NOT NULL,
    [UpdatedAt]         DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [UpdatedBy]         INT            NULL,
    CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Employees_EmployeeTypes_TypeCode] FOREIGN KEY ([TypeCode]) REFERENCES [BOG].[EmployeeTypes] ([Code]),
    CONSTRAINT [FK_Employees_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_Employees_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_Employees_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Employees_UserId_EmployeeNumber_EmployeeId]
    ON [BOG].[Employees]([UserId] ASC, [EmployeeNumber] ASC, [EmployeeId] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Employees_UserId]
    ON [BOG].[Employees]([UserId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Employees_UpdatedBy]
    ON [BOG].[Employees]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Employees_TypeCode]
    ON [BOG].[Employees]([TypeCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Employees_CreatedById]
    ON [BOG].[Employees]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Bog User', @level0type = N'SCHEMA', @level0name = N'BOG', @level1type = N'TABLE', @level1name = N'Employees', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Bog User', @level0type = N'SCHEMA', @level0name = N'BOG', @level1type = N'TABLE', @level1name = N'Employees', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Bog User', @level0type = N'SCHEMA', @level0name = N'BOG', @level1type = N'TABLE', @level1name = N'Employees', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Bog User', @level0type = N'SCHEMA', @level0name = N'BOG', @level1type = N'TABLE', @level1name = N'Employees', @level2type = N'COLUMN', @level2name = N'CreatedAt';

