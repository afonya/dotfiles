# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/afonya/.oh-my-zsh"
export EDITOR="nvim"
export BAT_THEME="Dracula"

# Настройка fzf
export FZF_DEFAULT_OPTS="--height 60% --layout=reverse --border --preview 'bat --style=numbers --color=always --line-range :500 {}'"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="alanpeabody"
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting fzf)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
function fe() {
    local files code_dir ignore
    
    code_dir="${HOME}/Documents/code"
    ignore="${HOME}/.config/fd/code_ignore"

    IFS=$'\n' files=$(fd . "$code_dir" --type file --follow --hidden --ignore-file $ignore)

    selected_file=$(echo $files | fzf) 
    filename=$selected_file:t
    file_path=$selected_file:h
    cd $file_path
    echo -ne "\033]0;editor\007"
    $EDITOR $selected_file
}

function wr() {
    local notes_dir

    notes_dir="/home/afonya/Dropbox/work/notes"

    IFS=$'\n' files=$(fd . "$notes_dir" --type file --follow --hidden)

    selected_file=$(echo $files | fzf) 
    filename=$selected_file:t
    file_path=$selected_file:h
    cd $file_path
    echo -ne "\033]0;editor\007"
    $EDITOR $selected_file
}

function convert_heic_to_jpg() {
    for IMG in $(find -name '*.heic')
    do 
        NEW_NAME=${IMG/%.heic/.jpg}
        heif-convert $IMG $NEW_NAME 
        convert -resize 1200x $NEW_NAME $NEW_NAME
    done
}

alias cls="clear"
alias vf="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' | xargs -r -I % $EDITOR % ;"
alias vc=fe
alias wr=wr

alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -vI"

alias vim="nvim"
alias v="nvim"
alias .dl="cd ~/Downloads"
alias .doc="cd ~/Documents"
alias .dev="cd ~/Documents/dev"
alias .code="cd ~/Documents/code"

alias rl="source ~/.zshrc"
# git alias
alias ga="git add ."
alias gcm="git commit -m"

alias df="df -H"
alias du="du -ch"
alias cat="bat -p"
alias ncat="bat"
alias hr="convert_heic_to_jpg"

# tmux new session
alias tn="tmux new-session -s tabs"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
