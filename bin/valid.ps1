if(!$env:SCOOP_HOME) { $env:SCOOP_HOME = resolve-path (split-path (split-path (scoop which scoop))) }
$validator = "$env:SCOOP_HOME/supporting/validator/bin/validator.exe"
$schema="$env:SCOOP_HOME/schema.json"
$bucket = "$psscriptroot/.." # checks the parent dir

Invoke-Expression -Command "$validator $schema $($args | ForEach-Object { "$_" })"
