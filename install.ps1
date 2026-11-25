# Installs CLAUDE.md and the skills from this repo into ~/.claude.
# Backs up an existing CLAUDE.md first. Skills with the same name are
# overwritten; other skills in ~/.claude/skills are left alone.

$ErrorActionPreference = 'Stop'
$repo   = $PSScriptRoot
$claude = Join-Path $HOME '.claude'
$skills = Join-Path $claude 'skills'

New-Item -ItemType Directory -Force $skills | Out-Null

$target = Join-Path $claude 'CLAUDE.md'
if (Test-Path $target) {
    $backups = Join-Path $claude 'backups'
    New-Item -ItemType Directory -Force $backups | Out-Null
    $stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
    Copy-Item $target (Join-Path $backups "CLAUDE.md.$stamp.bak")
    Write-Host "Backed up CLAUDE.md to backups\CLAUDE.md.$stamp.bak"
}
Copy-Item (Join-Path $repo 'CLAUDE.md') $target -Force
Write-Host 'Installed CLAUDE.md'

Get-ChildItem (Join-Path $repo 'skills') -Directory | ForEach-Object {
    $dest = Join-Path $skills $_.Name
    if (Test-Path $dest) { Remove-Item $dest -Recurse -Force }
    Copy-Item $_.FullName $dest -Recurse
    Write-Host "Installed skill $($_.Name)"
}

Write-Host 'Done. Start a new Claude Code session to load the changes.'
