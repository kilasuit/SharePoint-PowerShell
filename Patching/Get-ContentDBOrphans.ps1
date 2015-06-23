Add-PSSnapin "Microsoft.SharePoint.PowerShell" -ErrorAction SilentlyContinue
$Output = "D:\Output.txt"
"Content Database Orphans" > $Output
"------------------------" >> $Output
$WebApps = Get-SPWebApplication
Foreach ($WebApp in $WebApps) {"WebApp " + $WebApp.URL >> $Output; $CDBs = Get-SPContentDatabase -WebApplication $WebApp.URL; Foreach ($CDB in $CDBs) {" Database:" + $CDB.Name >> $Output;$CDB.Repair($false) >> $Output;"" >> $Output}}