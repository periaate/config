. $PSScriptRoot/dev.ps1

if ((pwd.exe) -eq ($home | fsio abs)) {
	cd /github.com/
}

function export {
	$k = $args[0]
	$v = $args[1]
	[System.Environment]::SetEnvironmentVariable($k.Trim(), $v.Trim(), [System.EnvironmentVariableTarget]::Process)
}

function loadenv {
	$envFilePath = ".\.env"
		if ($args.Length -ne 0) {
			$envFilePath = $args[0]
		}

	if (!(Test-Path $envFilePath)) {
			return
	}

	Get-Content $envFilePath | ForEach-Object {
		$vals = $_ -split '='
			$k = $vals[0]
			$v = $vals[1..($vals.Length - 1)] -join '='
			if ($k.length -eq 0 || $v.length -eq 0) {
				return
			}
		[System.Environment]::SetEnvironmentVariable($k.Trim(), $v.Trim(), [System.EnvironmentVariableTarget]::Process)
			$succ = false
	}
}

loadenv "$PSScriptRoot/.env"

# PowerShell configs
Remove-Item alias:ls
Remove-Item alias:echo
Remove-Item alias:copy
Remove-Item alias:pwd
Remove-Item alias:cat

New-Alias -Name e explorer
Set-Alias -Name ls -Value list
New-Alias -Name :: with
New-Alias -Name rename Rename-Item 

function gdl { gallery-dl --write-metadata $args }

$qr = "F:/curation/dl/"
$sfx_lightning = "D:/Downloads/lightning.mp3"

function dl { cd "$home\Downloads" }
function dt { cd "$home\Desktop" }
function qr { cd $qr }

function pwshc { pwsh -NoProfile -c ". $PSScriptRoot\..\Microsoft.PowerShell_profile_2.ps1 && $args" }
