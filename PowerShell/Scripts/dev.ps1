function run { build $args[0] && invoke $args }
function c { seek $args | cd }
function daily { note daily (day $args) }
function docs {	nvim (list ? readme) }
function def { start https://en.wiktionary.org/wiki/$Args }

function togif {
	ffmpeg -i $args[0] -filter_complex "[0:v] palettegen [palette]; [0:v][palette] paletteuse=dither=bayer:bayer_scale=5" $args[1]
}

function ydl {
	if ($Args.Count -gt 0) {
		yt-dlp -f 'bestvideo[ext=av1]+bestaudio[ext=opus]/bestvideo+bestaudio' --merge-output-format mkv --cookies-from-browser chrome --embed-thumbnail --write-info-json --embed-subs $Args
	}
}

function play {
	if ($Args.Count -eq 0) {
		mpvnet (list sort creation is media slice 0)
		return
	}
	mpvnet $Args
}


function init {
	<#
    .Description
    init initializes a new go project into the current directory.
    #>
	Param(
		[Parameter(Mandatory = $true)]
		[string]$Name
	)

    
	if (-Not ((Test-Path -Path ".git") -or (Test-Path -Path "go.mod"))) {
		go mod init $Name
		go work use .
		if (-Not (Test-Path -Path "main.go")) {
			"package main

func main() {

}" >> main.go
		}
		git init
	}
}



function note {
	$notes = "$home/notes/"
	if ($args.Length -eq 0) {
		cd $notes
		list
		return
	}

	$last = $args | slice -1

	if ($last -eq "?" -or $last -eq "find" -or $last -eq "list") {
		$args = $args | slice ":-1"
	}


	$args = $args | Join-String -separator /
	$base = $args | fp base
	$res = "$notes/$args.md"
	$res = $res | js "a => a.replaceAll('//', '/')"
	$dir = $res | fp dir

	if ($last -eq "?" -or $last -eq "find") {
		$fr = (list $dir ? $base)
		if ($fr.Length -gt 0) {
			nvim $fr
			return
		}
		return
	}

	if ($last -eq "list") {
		list $dir | js "a => a.replace('C:/Users/Daniel', '~')"
		return
	}

	fsio ensure $res
	nvim $res
}

function config {
	cd "$home/blume/config/$args"
}

function symconf {
	Param(
		[Parameter(Mandatory = $true)]
		[string]$src
	)
	$dst = "$home/blume/config/"
	mv $src $dst && fsio sym "$dst/$(fp base $src)" "./$(fp base $src)"
}

function loadenv {
	# AI generated code.
	$envFilePath = ".\.env"

	if (Test-Path $envFilePath) {
		Get-Content $envFilePath | ForEach-Object {
			$keyValue = $_.Split('=')
			if ($keyValue.Count -eq 2) {
				[System.Environment]::SetEnvironmentVariable($keyValue[0].Trim(), $keyValue[1].Trim(), [System.EnvironmentVariableTarget]::Process)
			}
		}
		Write-Host "Environment variables loaded successfully."
	}
	else {
		Write-Host "Error: .env file not found at path $envFilePath"
	}
}

function mc {
	Param(
		[Parameter(Mandatory = $true)]
		[string]$Path
	)
	mkdir $Path
	Set-Location $Path
}

function mci {
	Param(
		[Parameter(Mandatory = $true)]
		[string]$Path
	)
	mkdir $Path
	Set-Location $Path
	init (fp base $Path)
}
