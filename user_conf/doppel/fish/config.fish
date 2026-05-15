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
    alias nfu = 'doas nix flake update'   
    alias nrs = 'doas nixos-rebuild switch --impure --flake .#doppelnixer'
    alias nda = 'doas nixos-rebuild dry-activate --impure --flake .#doppelnixer'
    # Git Shortcuts
    alias gs ='git status'
    alias ga ='git add'
    alias gc ='git commit -m'
    alias gp ='git push -u origin'
    alias gl ='git log --oneline --graph --decorate'
    
    alias grep='grep --color=auto'
end
