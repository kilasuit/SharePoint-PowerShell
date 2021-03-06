asnp *SharePoint* -ea 0
$Output = "D:\output.csv"
$Headings = "Name","Server","MaxSites","WarningSites","WebApp"
$Headings -join "," | Out-File -Encoding default -FilePath $Output

Foreach ($CDB in (Get-SPContentDatabase))
{
$CDB.Name + "," + $CDB.Server + "," + $CDB.MaximumSiteCount + "," + $CDB.WarningSiteCount + "," + ($CDB).WebApplication.URL | Out-File -Encoding default -FilePath $Output -Append;
Dismount-SPContentDatabase $CDB.Name -confirm:$false;
}