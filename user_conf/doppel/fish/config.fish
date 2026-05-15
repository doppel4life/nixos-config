set -g fish_greeting

function fish_prompt
	set_color brcyan
	printf "%s" $USER
	set_color normal
	printf " in "
	set_color cyan
	printf "%s" (prompt_pwd)
    set_color yellow
    printf "%s" (fish_git_prompt)
	set_color normal
	printf " > "
end

# Start ssh-agent if not running
if not set -q SSH_AUTH_SOCK
    eval (ssh-agent -c)
    ssh-add ~/.ssh/id_ed25519_work > /dev/null 2>&1
    ssh-add ~/.ssh/id_ed25519_prof > /dev/null 2>&1
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
