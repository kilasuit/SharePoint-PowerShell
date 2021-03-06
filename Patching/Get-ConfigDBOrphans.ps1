Add-PSSnapin "Microsoft.SharePoint.PowerShell" -ErrorAction SilentlyContinue
$Output = "D:\Output.txt"
$Log = "D:\Log.txt"
"Configurationn Database Orphans" > $Output
"-------------------------------" >> $Output
$CDBs = Get-SPContentDatabase
Foreach ($CDB in $CDBs) {"Checking:" + $CDB.Name >> $Output;Stsadm -o EnumAllWebs -DatabaseServer $CDB.Server -DatabaseName $CDB.Name >> $Log;"Checks Complete:" + $CDB.Name >> $Output}
$OrphanCount = Get-Content $Log | Select-String "InSiteMap=`"False`"" | Measure-Object
"" >> $Output
[String]$OrphanCount.Count + " Orphaned Site(s) Found" >> $Output