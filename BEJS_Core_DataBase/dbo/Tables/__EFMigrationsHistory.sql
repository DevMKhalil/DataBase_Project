CREATE TABLE [dbo].[__EFMigrationsHistory] (
    [Id]          NVARCHAR (150) NOT NULL,
    [EF_Version]  NVARCHAR (32)  NOT NULL,
    [DeployedAt]  DATETIME2 (7)  NOT NULL,
    [FileVersion] NVARCHAR (20)  NULL,
    [Version]     NVARCHAR (20)  NULL,
    [Description] NVARCHAR (200) NULL,
    CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED ([Id] ASC)
);

