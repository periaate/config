. $PSScriptRoot\dev.ps1


# PowerShell configs
Remove-Item alias:ls
Remove-Item alias:echo
Remove-Item alias:copy
Remove-Item alias:pwd
Remove-Item alias:cat

New-Alias -Name e explorer
Set-Alias -Name ls -Value list
New-Alias -Name :: with
New-Alias -Name build dev
New-Alias -Name rename Rename-Item 
New-Alias -Name gdl gallery-dl

$qr = "F:/curation/dl/"
$cfg = "$home/blume/config/"

function commit { git add . && git commit $args }
function status { git status }

function dl { cd "$home\Downloads" }
function dt { cd "$home\Desktop" }
function qr { cd $qr }


# PSReadLine configuration
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# Posh Git configuration
Import-Module posh-git
$GitPromptSettings.DefaultPromptBeforeSuffix.Text = '`n'
$GitPromptSettings.DefaultPromptAbbreviateHomeDirectory = $true
$GitPromptSettings.DefaultPromptWriteStatusFirst = $true


Import-Module -Name Terminal-Icons



# Generated
function ghcs {
	# Debug support provided by common PowerShell function parameters, which is natively aliased as -d or -db
	# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_commonparameters?view=powershell-7.4#-debug
	param(
		[ValidateSet('gh', 'git', 'shell')]
		[Alias('t')]
		[String]$Target = 'shell',

		[Parameter(Position = 0, ValueFromRemainingArguments)]
		[string]$Prompt
	)
	begin {
		# Create temporary file to store potential command user wants to execute when exiting
		$executeCommandFile = New-TemporaryFile

		# Store original value of GH_DEBUG environment variable
		$envGhDebug = $Env:GH_DEBUG
	}
	process {
		if ($PSBoundParameters['Debug']) {
			$Env:GH_DEBUG = 'api'
		}

		gh copilot suggest -t $Target -s "$executeCommandFile" $Prompt
	}
	end {
		# Execute command contained within temporary file if it is not empty
		if ($executeCommandFile.Length -gt 0) {
			# Extract command to execute from temporary file
			$executeCommand = (Get-Content -Path $executeCommandFile -Raw).Trim()

			# Insert command into PowerShell up/down arrow key history
			[Microsoft.PowerShell.PSConsoleReadLine]::AddToHistory($executeCommand)

			# Insert command into PowerShell history
			$now = Get-Date
			$executeCommandHistoryItem = [PSCustomObject]@{
				CommandLine        = $executeCommand
				ExecutionStatus    = [Management.Automation.Runspaces.PipelineState]::NotStarted
				StartExecutionTime = $now
				EndExecutionTime   = $now.AddSeconds(1)
			}
			Add-History -InputObject $executeCommandHistoryItem

			# Execute command
			Write-Host "`n"
			Invoke-Expression $executeCommand
		}
	}
	clean {
		# Clean up temporary file used to store potential command user wants to execute when exiting
		Remove-Item -Path $executeCommandFile

		# Restore GH_DEBUG environment variable to its original value
		$Env:GH_DEBUG = $envGhDebug
	}
}

function ghce {
	# Debug support provided by common PowerShell function parameters, which is natively aliased as -d or -db
	# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_commonparameters?view=powershell-7.4#-debug
	param(
		[Parameter(Position = 0, ValueFromRemainingArguments)]
		[string[]]$Prompt
	)
	begin {
		# Store original value of GH_DEBUG environment variable
		$envGhDebug = $Env:GH_DEBUG
	}
	process {
		if ($PSBoundParameters['Debug']) {
			$Env:GH_DEBUG = 'api'
		}

		gh copilot explain $Prompt
	}
	clean {
		# Restore GH_DEBUG environment variable to its original value
		$Env:GH_DEBUG = $envGhDebug
	}
}

function rr-list {
	[Microsoft.PowerShell.PSConsoleReadLine]::CancelLine()
	[Microsoft.PowerShell.PSConsoleReadLine]::Insert("list .")
	[Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

function rr-dir {
	[Microsoft.PowerShell.PSConsoleReadLine]::CancelLine()
	[Microsoft.PowerShell.PSConsoleReadLine]::Insert("list . is dir")
	[Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

function rr-last {
	set-location -
	[Microsoft.PowerShell.PSConsoleReadLine]::InvokePrompt()
}

function rr-up {
	set-location ..
	[Microsoft.PowerShell.PSConsoleReadLine]::InvokePrompt()
}

Set-PSReadLineKeyHandler -Chord 'Ctrl+/' -ScriptBlock { rr-list }
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -ScriptBlock { rr-dir }
Set-PSReadLineKeyHandler -Chord 'Ctrl+p' -ScriptBlock { rr-last }
Set-PSReadLineKeyHandler -Chord 'Ctrl+u' -ScriptBlock { rr-up }
Set-PSReadLineKeyHandler -Chord 'Ctrl+e' -ScriptBlock { explorer .}
