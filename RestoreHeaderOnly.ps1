﻿
#import sql server module
import-module sqlps -disablenamechecking
#add-type -assemblyname "microsoft.sqlserver.smo"

$instanceName = "JLangdon"
$server = New-Object -TypeName Microsoft.SqlServer.Management.Smo.Server -ArgumentList $instanceName
#$databasename = "AdventureWorks2008R2"
#$database = $server.Databases[$databasename]

$smoRestore = New-Object Microsoft.SqlServer.Management.Smo.Restore
#replace this with your backup file
$backupfile = "mac.bak"

#change this to where your backup directory is
#in our case we're using default backup directory
$backupfilepath = Join-Path $server.Settings.BackupDirectory $backupfile
$smoRestore.Devices.AddDevice($backupfilepath, [Microsoft.SqlServer.Management.Smo.DeviceType]::File)
$smoRestore.ReadBackupHeader($server)
$smoRestore.ReadFileList($server)


