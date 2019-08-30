#  Remove all diagnostic settings for SQL DBs that the have been has turned on

$rsgs = '';
foreach ($rsg in $rsgs) {
    $svr = Get-AzureRmSqlServer -ResourceGroupName $rsg
    $svr.ServerName
    $dbs = Get-AzureRmSqlDatabase -ResourceGroupName $rsg -ServerName $svr.ServerName
    foreach ($db in $dbs) {
        $db.DatabaseName
        Remove-AzureRmDiagnosticSetting -ResourceId $db.ResourceId
    }
}
