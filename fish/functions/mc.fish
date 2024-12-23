function mc --description 'Create a directory and set CWD'
    command mkdir $argv
    if test $status = 0
        switch $argv[(count $argv)]
            case '-*'

            case '*'
				zoxide add $argv[(count $argv)]
                cd $argv[(count $argv)]
                return
        end
    end
end
