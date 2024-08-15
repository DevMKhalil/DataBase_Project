CREATE TABLE [JREC].[JudicialRecordAttendancesHistory] (
    [Id]               INT            NOT NULL,
    [JudicialRecordId] INT            NOT NULL,
    [UserId]           INT            NOT NULL,
    [AttendanceTime]   TIME (7)       NOT NULL,
    [CertifiedDate]    DATETIME2 (7)  NULL,
    [CertifyCode]      NVARCHAR (MAX) NULL,
    [ValidTo]          DATETIME2 (7)  NOT NULL,
    [ValidFrom]        DATETIME2 (7)  NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_JudicialRecordAttendancesHistory]
    ON [JREC].[JudicialRecordAttendancesHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

