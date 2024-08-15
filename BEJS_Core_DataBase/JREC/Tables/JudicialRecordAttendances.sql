CREATE TABLE [JREC].[JudicialRecordAttendances] (
    [Id]               INT                                                IDENTITY (1, 1) NOT NULL,
    [JudicialRecordId] INT                                                NOT NULL,
    [UserId]           INT                                                NOT NULL,
    [AttendanceTime]   TIME (7)                                           NOT NULL,
    [CertifiedDate]    DATETIME2 (7)                                      NULL,
    [CertifyCode]      NVARCHAR (MAX)                                     NULL,
    [ValidTo]          DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom]        DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    CONSTRAINT [PK_JudicialRecordAttendances] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_JudicialRecordAttendances_JudicialRecords_JudicialRecordId] FOREIGN KEY ([JudicialRecordId]) REFERENCES [JREC].[JudicialRecords] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_JudicialRecordAttendances_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [AUTH].[Users] ([Id]),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[JREC].[JudicialRecordAttendancesHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [IX_JudicialRecordAttendances_UserId]
    ON [JREC].[JudicialRecordAttendances]([UserId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_JudicialRecordAttendances_JudicialRecordId]
    ON [JREC].[JudicialRecordAttendances]([JudicialRecordId] ASC);

