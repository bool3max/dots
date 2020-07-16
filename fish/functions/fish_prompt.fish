# Defined in /tmp/fish.rp3mPC/fish_prompt.fish @ line 2
function fish_prompt --description 'Custom fish prompt'
	echo -ne "\e[1m\e[34m$USER"
    #"in"
    echo -ne "\e[95m in"
    #current directory
    echo -ne "\e[93m "(string replace -i "/home/$USER" "~" $PWD)

    # ------------ GIT ------------
    # NOTE: requires universal variable "MAX_PARENT_GIT_DIR_TRAVERSE" to be set to an integer that tells the script how deep to recursively look for git repo
    # I usually use "6"
    set _start_dir '.'
    set _is_git_repo 'false'
    for n in (seq $MAX_PARENT_GIT_DIR_TRAVERSE)
        if test -d "$_start_dir/.git/"
            set _is_git_repo 'true'
            break
        end

        set _start_dir "$_start_dir/../"
    end

    if test $_is_git_repo = 'true'
        # current dir is a git repo
        echo -ne " -\e[96m  "(git branch --show-current)"\e[0m" # branch name
        echo -ne ", \e[32m"(git log -1 --pretty=%h 2>/dev/null || echo -en "\e[31mNO COMMITS\e[0m")"\e[0m" # short hash of last commit, or "NO COMMITS"
    end
    # ------------ GIT ------------


	if set -Uq pss
        # requires 'sp' in PATH
	    set -l IFS ''
        set -l spotify_active 'false'
        set -l sptmtd (command sp metadata); and set -l spotify_active 'true'; and set -l artist (grep -Po '(?<=albumArtist\|)(.*)' (echo -n $sptmtd | psub)); and set -l song (grep -Po '(?<=title\|)(.*)' (echo -n $sptmtd | psub))

        if test $spotify_active = 'true'
		    echo -ne "\e[95m playing \e[32m  \e[39m$artist - $song"
        end
	end

	echo -e "\e[90m\e[1m\n  \e[0m"
end
