﻿

PRINT '     _  _                                       '
PRINT '    | || |  _            _                      '
PRINT '    | || |_| |_ ___  ___| |_ _   _ _ __ ___     '
PRINT '    |__   _| __/ _ \/ __| __| | | |  __/ _ \    '
PRINT '       |_| | ||  __/ (__| |_| |_| | | |  __/    '
PRINT '            \__\___|\___|\__|\__,_|_|  \___|    '
PRINT '                                                '
PRINT '        empower your software solutions         '
PRINT '                                                '

PRINT '******************* referencedata scripts *******************'

-- Start transaction for all referencedata scripts
BEGIN TRANSACTION;
BEGIN TRY

    DECLARE @DBEXISTS bit;
    SET @DBEXISTS = 0;

    DECLARE @DBNAME NVARCHAR(128);
    SET @DBNAME = DB_NAME();

    DECLARE @DBID INT;
    SET @DBID = DB_ID();

    IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = @DBNAME)
    BEGIN
        PRINT 'The database ' +  @DBNAME + ' does not yet exist. All referencedata deployment scripts will be skipped.'
        SET @DBEXISTS = 0
    END
    ELSE
    BEGIN
        PRINT 'The database ' +  @DBNAME + ' already exists. referencedata deployment scripts will be executed.'
        SET @DBEXISTS = 1
    END
    
    -- Prefill the _MigrationScriptsHistory table with the existing migration scripts when applying the first time
    IF @DBEXISTS=1 AND 'referencedata'='referencedata'
    BEGIN    
        IF OBJECT_ID(N'dbo._MigrationScriptsHistory', N'U') IS NOT NULL
        BEGIN
            IF NOT EXISTS (SELECT * FROM [dbo].[_MigrationScriptsHistory])
            BEGIN
                PRINT N'Set default values for MigrationScriptsHistory';

                INSERT INTO [dbo].[_MigrationScriptsHistory] 
                VALUES
                    ('PreScripts\20171016123600_Initial_Setup.sql', GETUTCDATE(),'FtZ5yB+xpknBlTpdwS/yeQ==')
                    ,('PostScripts\20171016123600_SetupInitialData.sql', GETUTCDATE(),'hS0MUZNFcGCbbj3MjSfmPQ==')
                    ,('initialization\_migrationscriptshistory', GETUTCDATE(),'ZmI3OWI5ZThiOWU2ZGU5MTYwODFkYmJmN2M3ZjFlYzM=')
            END
            ELSE
            BEGIN
                PRINT N'MigrationScriptsHistory already has entries, skipping.';
            END
        END
        ELSE
        BEGIN
            RAISERROR ('ERROR: The migration script history table _MigrationScriptsHistory does not exists.', 18, 1);
        END
    END

    -- Only run scripts of type 'referencedata' if the database exists, otherwise skip.
    IF @DBEXISTS=1 AND 'referencedata'='referencedata'
    BEGIN    
        -- Run the new migration script
        PRINT '------------------ RUN --------------------------'
        PRINT 'Script Id:      ReferenceDataScripts\1_Production.Location.sql'
        PRINT 'Script Name:    1_Production.Location.sql'
        PRINT 'Order Criteria: 1'
        PRINT 'Script Type:    referencedata'
        PRINT 'Script Path:    C:\Users\NTG\source\repos\BEJS_Core_DataBase\BEJS_Core_DataBase\Scripts\ReferenceDataScripts\1_Production.Location.sql'
        PRINT 'Script Hash:    sC4/wK1y0UGTRbJnKnZaRg=='
        
        PRINT ' > Start referencedata-script run....'
        exec('
USE [AdventureWorks2022]


--MERGE generated by ''sp_generate_merge'' stored procedure
--Originally by Vyas (http://vyaskn.tripod.com/code): sp_generate_inserts (build 22)
--Adapted for SQL Server 2008+ by Daniel Nolan (https://twitter.com/dnlnln)

SET NOCOUNT ON

SET IDENTITY_INSERT [Production].[Location] ON

MERGE INTO [Production].[Location] AS [Target]
USING (VALUES
  (1,N''Tool Crib'',0.0000,0.00,''2008-04-30T00:00:00'')
 ,(2,N''Sheet Metal Racks'',0.0000,0.00,''2008-04-30T00:00:00'')
 ,(3,N''Paint Shop'',0.0000,0.00,''2008-04-30T00:00:00'')
 ,(4,N''Paint Storage'',0.0000,0.00,''2008-04-30T00:00:00'')
 ,(5,N''Metal Storage'',0.0000,0.00,''2008-04-30T00:00:00'')
 ,(6,N''Miscellaneous Storage'',0.0000,0.00,''2008-04-30T00:00:00'')
 ,(7,N''Finished Goods Storage'',0.0000,0.00,''2008-04-30T00:00:00'')
 ,(10,N''Frame Forming'',22.5000,96.00,''2008-04-30T00:00:00'')
 ,(20,N''Frame Welding'',25.0000,108.00,''2008-04-30T00:00:00'')
 ,(30,N''Debur and Polish'',14.5000,120.00,''2008-04-30T00:00:00'')
 ,(40,N''Paint'',15.7500,120.00,''2008-04-30T00:00:00'')
 ,(45,N''Specialized Paint'',18.0000,80.00,''2008-04-30T00:00:00'')
 ,(50,N''Subassembly'',12.2500,120.00,''2008-04-30T00:00:00'')
 ,(60,N''Final Assembly'',12.2500,120.00,''2008-04-30T00:00:00'')
) AS [Source] ([LocationID],[Name],[CostRate],[Availability],[ModifiedDate])
ON ([Target].[LocationID] = [Source].[LocationID])
WHEN MATCHED AND (
	NULLIF([Source].[Name], [Target].[Name]) IS NOT NULL OR NULLIF([Target].[Name], [Source].[Name]) IS NOT NULL OR 
	NULLIF([Source].[CostRate], [Target].[CostRate]) IS NOT NULL OR NULLIF([Target].[CostRate], [Source].[CostRate]) IS NOT NULL OR 
	NULLIF([Source].[Availability], [Target].[Availability]) IS NOT NULL OR NULLIF([Target].[Availability], [Source].[Availability]) IS NOT NULL OR 
	NULLIF([Source].[ModifiedDate], [Target].[ModifiedDate]) IS NOT NULL OR NULLIF([Target].[ModifiedDate], [Source].[ModifiedDate]) IS NOT NULL) THEN
 UPDATE SET
  [Target].[Name] = [Source].[Name], 
  [Target].[CostRate] = [Source].[CostRate], 
  [Target].[Availability] = [Source].[Availability], 
  [Target].[ModifiedDate] = [Source].[ModifiedDate]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([LocationID],[Name],[CostRate],[Availability],[ModifiedDate])
 VALUES([Source].[LocationID],[Source].[Name],[Source].[CostRate],[Source].[Availability],[Source].[ModifiedDate])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE;

DECLARE @mergeError int
 , @mergeCount int
SELECT @mergeError = @@ERROR, @mergeCount = @@ROWCOUNT
IF @mergeError != 0
 BEGIN
 PRINT ''ERROR OCCURRED IN MERGE FOR [Production].[Location]. Rows affected: '' + CAST(@mergeCount AS VARCHAR(100)); -- SQL should always return zero rows affected
 END
ELSE
 BEGIN
 PRINT ''[Production].[Location] rows affected by MERGE: '' + CAST(@mergeCount AS VARCHAR(100));
 END




SET IDENTITY_INSERT [Production].[Location] OFF
SET NOCOUNT OFF
')
        PRINT ' > Finished referencedata-script run....'
        
        PRINT '----------------- END RUN ------------------------'
        PRINT '|'
    END
END TRY
BEGIN CATCH
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    SELECT @ErrorMessage = ERROR_MESSAGE(),
           @ErrorSeverity = ERROR_SEVERITY(),
           @ErrorState = ERROR_STATE();

    -- Rollback all transactions if any of the referencedata scripts failed.
    IF @@TRANCOUNT > 0  
        ROLLBACK TRANSACTION;

    RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);

END CATCH;

-- Commit transaction if all referencedata scripts have been successfully run.
IF @@TRANCOUNT > 0  
    COMMIT TRANSACTION;  
GO