function run { build $args[0] && invoke $args }
function c { seek $args | cd }
function daily { note daily (day $args) }
function docs {	nvim (list ? readme) }
function def { start https://en.wiktionary.org/wiki/$Args }

function ensure { fsio ensure $args }

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
	if ($args.Length -eq 0) {
		cd "$home/notes/"
		list
		return
	}

	$res = "$(fsio join $home notes $args).md"
	echo $res

	fsio ensure file $res
	nvim $res
}

function config {
	cd "$blume/config/$args"
}

function symconf {
	Param(
		[Parameter(Mandatory = $true)]
		[string]$src
	)
	$dst = "$blume/config/"
	mv $src $dst && fsio sym "$dst/$(fp base $src)" "./$(fp base $src)"
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

