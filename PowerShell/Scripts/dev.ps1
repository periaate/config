function run { build $args[0] && invoke $args }
function daily { note daily (day $args) }
function docs {	nvim (list ? readme) }

function def { start https://en.wiktionary.org/wiki/$Args }
function ensure { fsio ensure $args }

function docker { wsl docker $args }
function dc { wsl docker compose $args }
function dcu { wsl docker compose up $args }
function dcs { wsl docker compose stop $args }
function dcb { wsl docker compose build $args }
function dcre { wsl docker compose stop $args "&&" docker compose build $args "&&" docker compose up $args }

function config { cd "$blume/config/$args" && nvim }
function recycle { start shell:RecycleBinFolder }

function tru { "run $args" >> \\.\pipe\toimi }
function resource { . $PSScriptRoot\Scripts\load.ps1 }
function latest { list sort mod slice 0 }
function ad {zoxide query $args}

function commit { git add . && git commit $args }
function status { git status }
function push { git push $args }
function pull { git pull $args }


function gclone {
	$src = pwd | fsio dir | fsio base
	$a = "git@$($src):$(pwd | fsio base)/$args.git"
	git clone $a
}



function stream {
    window resize proj 2160 1440 &&
    window move proj (5120-2160) (2160-1440) &&
    c obsmana &&
    loadenv &&
    obsmana
}

function release {
    tagver &&
    git push origin &&
    git tag (tagver patch) &&
    git push origin (tagver)
}

function togif {
	ffmpeg -i $args[0] -filter_complex "[0:v] palettegen [palette]; [0:v][palette] paletteuse=dither=bayer:bayer_scale=5" $args[1]
}

function ydl {
	if ($Args.Count -gt 0) {
		yt-dlp -f 'bestvideo[ext=av1]+bestaudio[ext=opus]/bestvideo+bestaudio' --merge-output-format mkv --cookies-from-browser chrome --write-info-json --embed-subs $Args
	}
}

function mdl {
	if ($Args.Count -gt 0) {
		c music
		yt-dlp -f 'bestvideo[ext=av1]+bestaudio[ext=opus]/bestvideo+bestaudio' --merge-output-format mkv --cookies-from-browser chrome --embed-thumbnail --write-info-json --embed-subs $Args
		cd -
	}
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

function symconf {
	Param(
		[Parameter(Mandatory = $true)]
		[string]$src
	)
	$dst = "$blume/config/"
	mv $src $dst && fsio sym "$dst/$(fsio base $src)" "./$(fsio base $src)"
}

function mc {
	Param(
		[Parameter(Mandatory = $true)]
		[string]$Path
	)
	mkdir $Path

	zoxide add $Path
	Set-Location $Path
}

function mci {
	Param(
		[Parameter(Mandatory = $true)]
		[string]$Path
	)
	mkdir $Path

	zoxide add $Path
	Set-Location $Path
	init (fsio base $Path)
}

function wakapi { cd D:/tools/ && loadenv && ./wakapi.exe $args }

function x_auth    { c xh auth && wgo -dir src cargo run }
function x_sdb     { c xh sdb && wgo -dir src cargo run }
function x_feeds   { c xh golib && loadenv && wgo -xdir data go run ./cmd/feeds/main.go }
function x_medias  { c xh golib && loadenv && wgo -xdir data go run ./cmd/medias/main.go }
function x_gateway { c xh gateway && loadenv && caddy run }
function x_client  { c xh xclient && loadenv && deno run dev --host --port 3000 }
function x_client_local  { c xh xclient && loadenv && deno run dev --port 5173 }
function x_stack   { c xh && dcre }

function d_fwauth  { c fwauth && wgo pwshc "pwshc build fwauth && c xh gateway && loadenv && fwauth localhost:8018" }
function d_dns  { c so cfcli && loadenv && cfcli }
function d_proxy  { c xh gateway prod && loadenv && caddy run }
function d_local_proxy  { c xh xclient && loadenv && caddy run }

function wsl_net { wsl "echo" "nameserver 8.8.8.8" ">" "/etc/resolv.conf" }

function getRelease {
	$path = zoxide query $args
	echo "$(getmod $path)@$(tagver $path)"
}

function getLatest {
	$path = zoxide query $args
	if ($path) {
		go get "$(getmod $path)@$(tagver $path)" && go mod tidy
	}
}

function rasm_run {
	rasm $args && rainbow -l $rainbow ($args | js "a => a.replace('rasm', 'rbb')")
}

# good start, but more work needed
function run_all {
	runn `
		client  pwshc x_client  ?? `
		auth    pwshc x_auth    ?? `
		sbd     pwshc x_sdb     ?? `
		feeds   pwshc x_feeds   ?? `
		medias  pwshc x_medias  ?? `
		gateway pwshc x_gateway ?? `
		local   pwshc x_client_local 
}

function run_stack_local {
	runn `
		medias  pwshc x_client_local  ?? `
		gateway pwshc d_local_proxy
}

function run_prod {
	runn `
		fwauth  pwshc d_fwauth  ?? `
		dns     pwshc d_dns     ?? `
		proxy   pwshc d_proxy
}

function run_stack_docker {
	runn `
		docker  pwshc x_stack ?? `
		local   pwshc run_local
}

function run_stack_prod {
	runn `
		proxy pwshc run_prod ?? `
		stack pwshc run_all
}



function build { dev $args }


