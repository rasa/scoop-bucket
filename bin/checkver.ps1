if(!$env:SCOOP_HOME) { $env:SCOOP_HOME = resolve-path (split-path (split-path (scoop which scoop))) }
$checkver = "$env:SCOOP_HOME/bin/checkver.ps1"
$bucket = "$psscriptroot/.." # checks the parent dir
Invoke-Expression -command "$checkver -dir $bucket $($args | ForEach-Object { "$_ " })"
