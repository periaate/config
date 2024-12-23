if status is-interactive
	if string match -re "/home/\w*\$" (pwd)
		cd github.com
	end

	# Commands to run in interactive sessions can go here
	function fish_prompt	
		set -l last_status $status
		set -l stat
		if test $last_status -ne 0
			set stat (set_color red)"[$last_status]"(set_color normal)
		end
		printf "%s %s %s\n>" (prompt_pwd) (fish_git_prompt) $stat
	end
end

# pnpm
set -gx PNPM_HOME "/home/periaate/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
	set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end


abbr -a commit git commit
abbr -a pull git pull
abbr -a push git push
abbr -a status git status

function last_history_item
    echo $history[1]
end
abbr -a !! --position anywhere --function last_history_item

abbr -a build "devt build"                  # to be compiled
abbr -a "??" --position anywhere "| filter" # to be compiled
abbr -a @: --position anywhere "| slice"    # to be compiled
abbr -a @= --position anywhere "| with"     # to be compiled
abbr -a @x --position anywhere "| xargs"
abbr -a @p --position anywhere "| parallel"

#abbr -a @% --position anywhere -- "-I %"


abbr -a dc docker compose
abbr -a dcu docker compose up
abbr -a dcs docker compose stop
abbr -a dcb docker compose build
function dcr
	docker compose stop $argv and
	docker compose build $argv and
	docker compose up $argv
end


bind \cd 'cd ..; commandline -f repaint'
bind \cp prevd

bind \ca prevd-or-backward-word
bind \co nextd-or-forward-word

bind \cu up-or-search
bind \ce down-or-search

bind \cg complete


export PATH="$HOME/.local/bin:$PATH"
export EDITOR="/usr/bin/nvim"

zoxide init fish --cmd c | source
