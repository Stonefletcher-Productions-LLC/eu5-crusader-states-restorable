param(
    [string]$UserDataPath = '',
    [string]$PythonPath = 'python'
)
# Copies the mod into Documents\Paradox Interactive\Europa Universalis V\mod\crusader_states_restorable.
# An existing copy is moved to mod-backups first.
$ErrorActionPreference = 'Stop'
$project = Split-Path -Parent $PSScriptRoot
$source = Join-Path $project 'mod'
if (-not (Test-Path -LiteralPath $source)) { $source = Join-Path $project 'crusader_states_restorable' }
if (-not $UserDataPath) { $UserDataPath = Join-Path ([Environment]::GetFolderPath('MyDocuments')) 'Paradox Interactive\Europa Universalis V' }
$modsRoot = [IO.Path]::GetFullPath((Join-Path $UserDataPath 'mod'))
$destination = Join-Path $modsRoot 'crusader_states_restorable'
if (Get-Process eu5 -ErrorAction SilentlyContinue) { throw 'Close EU5 before installing.' }
if (-not (Test-Path -LiteralPath (Join-Path $source 'release-manifest.json'))) {
    & $PythonPath (Join-Path $PSScriptRoot 'build.py')
    if ($LASTEXITCODE -ne 0) { throw 'Build failed; nothing installed.' }
}
$metadata = Get-Content -LiteralPath (Join-Path $source '.metadata\metadata.json') -Raw | ConvertFrom-Json
$manifest = Get-Content -LiteralPath (Join-Path $source 'release-manifest.json') -Raw | ConvertFrom-Json
if ($metadata.id -ne 'alex.crusader_states_restorable' -or $metadata.version -ne $manifest.version) { throw 'Package identity/version mismatch.' }
foreach ($entry in $manifest.files.PSObject.Properties) {
    $file = Join-Path $source $entry.Name
    $hash = (Get-FileHash -LiteralPath $file -Algorithm SHA256).Hash.ToLowerInvariant()
    if ($hash -ne $entry.Value) { throw "Hash mismatch: $($entry.Name)" }
}
if (Test-Path -LiteralPath (Join-Path $modsRoot 'crusader_states')) {
    Write-Warning 'Crusader States - Restoration is also installed. Do not enable both in one playset.'
}
New-Item -ItemType Directory -Path $modsRoot -Force | Out-Null
if (Test-Path -LiteralPath $destination) {
    $backup = Join-Path $UserDataPath ('mod-backups\crusader_states_restorable-' + [DateTime]::UtcNow.ToString('yyyyMMdd-HHmmss'))
    New-Item -ItemType Directory -Path (Split-Path -Parent $backup) -Force | Out-Null
    Move-Item -LiteralPath $destination -Destination $backup
    Write-Output "Previous copy moved to $backup"
}
Copy-Item -LiteralPath $source -Destination $destination -Recurse
Write-Output "Installed $($metadata.name) $($metadata.version) to $destination"
