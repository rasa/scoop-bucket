if(!$env:SCOOP_HOME) { $env:SCOOP_HOME = resolve-path (split-path (split-path (scoop which scoop))) }
$checkver = "$env:SCOOP_HOME/bin/checkver.ps1"
$formatjson = "$env:SCOOP_HOME/bin/formatjson.ps1"

$bucket = "$psscriptroot/.." # checks the parent dir

Invoke-Expression -Command "$checkver -dir $bucket $($args | ForEach-Object { "$_ " }) -u"
Invoke-Expression -Command "$formatjson -path $bucket"
