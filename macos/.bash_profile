# ---------------------------------------------------------------
#                  PROMPT CONFIGURATION                      {{{
# ---------------------------------------------------------------

export PS1="\e[0;34m\w:\e[m"
PROMPT_DIRTRIM=3

#}}}
# ---------------------------------------------------------------
#                          SET PATHS                          {{{
# ---------------------------------------------------------------

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

#}}}
# ---------------------------------------------------------------
#                        ANDROID                              {{{
# ---------------------------------------------------------------

# export ANT_HOME=/usr/local/opt/ant
# export MAVEN_HOME=/usr/local/opt/maven
# export GRADLE_HOME=/usr/local/opt/gradle
# export ANDROID_HOME=/usr/local/opt/android-sdk
# export ANDROID_NDK_HOME=/usr/local/opt/android-ndk

#}}}
# ---------------------------------------------------------------
#                        ANDROID STUDIO                       {{{
# ---------------------------------------------------------------

# export ANDROID_HOME=${HOME}/Library/Android/sdk
# export PATH=${PATH}:${ANDROID_HOME}/tools
# export PATH=${PATH}:${ANDROID_HOME}/platform-tools

#}}}
# ---------------------------------------------------------------
#                        BASH COMPLETION                      {{{
# ---------------------------------------------------------------

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# }}}
# ---------------------------------------------------------------
#                               GOENV                         {{{
# ---------------------------------------------------------------

export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"

#}}}
# ---------------------------------------------------------------
#                                 NVM                         {{{
# ---------------------------------------------------------------

export NVM_DIR="$HOME/.nvm"
  . "$(brew --prefix nvm)/nvm.sh"

[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion


#}}}
# ---------------------------------------------------------------
#                                NPM                          {{{
# ---------------------------------------------------------------

# List only top-level packages within npm
alias npmls='npm ls -g --depth=0'
# NPM global update command
alias nuc='npm upgrade -g'

alias npmg="npm -g"
alias npmgo="npm -g outdated"
alias npmgo0='npm -g outdated --depth=0'
alias npmo0='npm outdated --depth=0'

alias ni="npm install"
alias nis="npm install --save"
alias nisd="npm install --save-dev"

alias nt="npm test"
alias nr="npm run"

#}}}
# ---------------------------------------------------------------
#                              PYENV                         {{{
# ---------------------------------------------------------------

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

#}}}
# ---------------------------------------------------------------
#                              PYTHON                         {{{
# ---------------------------------------------------------------



#}}}
# ---------------------------------------------------------------
#                               RBENV                         {{{
# ---------------------------------------------------------------

export RBENV_ROOT=/usr/local/var/rbenv
eval "$(rbenv init -)"

# Prints the latest version of Ruby through rbenv
alias recentruby='rbenv install -l | grep -v - | tail -1'
# Rubygem update command
alias ruc='gem update'

#}}}
# ---------------------------------------------------------------
#                               RAILS                         {{{
# ---------------------------------------------------------------

alias b="bundle"
alias be="bundle exec"
alias bi="b install --path vendor"
alias bl="bundle list"
alias bu="bundle update"
alias bp="bundle package"

alias rt="rake -T"
alias rr="rake routes"

alias r='rails'
alias rg='rails g'
alias rs='rails s'
alias rc='rails c'
alias rn='rails new'
alias rd='rails dbconsole'
alias rp='rails plugin'
alias ra='rails application'
alias rd='rails destroy'

#}}}
# ---------------------------------------------------------------
#                    TERMINAL FUNCTION                        {{{
# ---------------------------------------------------------------


function hbuc (){
    echo 'Running brew update'
    brew update
    echo 'Upgrading brew packages'
    brew upgrade
    echo 'Running brew cleanup'
    brew cleanup
    brew cleanup -s
}

# General purpose extract function
function extract (){
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xvjf $1 && cd $(basename "$1" .tar.bz2) ;;
            *.tar.gz)   tar xvzf $1 && cd $(basename "$1" .tar.gz) ;;
            *.tar.xz)   tar Jxvf $1 && cd $(basename "$1" .tar.xz) ;;
            *.bz2)      bunzip2 $1 && cd $(basename "$1" /bz2) ;;
            *.rar)      unrar x $1 && cd $(basename "$1" .rar) ;;
            *.gz)       gunzip $1 && cd $(basename "$1" .gz) ;;
            *.tar)      tar xvf $1 && cd $(basename "$1" .tar) ;;
            *.tbz2)     tar xvjf $1 && cd $(basename "$1" .tbz2) ;;
            *.tgz)      tar xvzf $1 && cd $(basename "$1" .tgz) ;;
            *.zip)      unzip $1 && cd $(basename "$1" .zip) ;;
            *.Z)        uncompress $1 && cd $(basename "$1" .Z) ;;
            *.7z)       7z x $1 && cd $(basename "$1" .7z) ;;
            *)      echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}
# Create an archive (*.tar.gz) from given DIR
function maketar(){
    tar cvzf "${1%%/}.tar.gz"  "${1%%/}/";
}
# Create a zip archive of a file/folder
function makezip(){
    zip -r "${1%%/}.zip" "$1" ;
}
# Get current host related info
function ii(){
    echo -e "\nYou are logged on ${BRed}$HOST"
    echo -e "\n${BRed}Additionnal information:$NC " ; uname -a
    echo -e "\n${BRed}Current date :$NC " ; date
    echo -e "\n${BRed}Machine stats :$NC " ; uptime
    echo -e "\n${BRed}Memory stats :$NC " ; vmli
    echo -e "\n${BRed}Diskspace :$NC " ; mydf / $HOME
    echo -e "\n${BRed}Open connections :$NC "; netstat -atp tcp | grep -i "listen";
    echo
}
# Cleans up vm_stat a bit
function vmli (){
    vm_stat | perl -ne '/page size of (\d+)/ and $size=$1; /Pages\s+([^:]+)[^\d]+(\d+)/ and printf("%-16s % 16.2f Mi\n", "$1:", $2 * $size / 1048576);'
}
# Pretty-print of 'df' output
function mydf(){
    for fs ; do

        if [ ! -d $fs ]
        then
          echo -e $fs" :No such file or directory" ; continue
        fi

        local info=( $(command df -P $fs | awk 'END{ print $2,$3,$5 }') )
        local free=( $(command df -Pkh $fs | awk 'END{ print $4 }') )
        local nbstars=$(( 20 * ${info[1]} / ${info[0]} ))
        local out="["
        for ((j=0;j<20;j++)); do
            if [ ${j} -lt ${nbstars} ]; then
               out=$out"*"
            else
               out=$out"-"
            fi
        done
        out=${info[2]}" "$out"] ("$free" free on "$fs")"
        echo -e $out
    done
}
# Ejects Disk
function diskeject(){
    if [ -z "$1" ]
    then
        echo "You need to tell me which disk you want to eject."
        diskls
    else
        diskutil eject /dev/disk$1
        echo "Booyakasha!"
    fi
}
# Youtube-DL 
function yt(){
    youtube-dl -o "%(playlist_index)s-%(title)s.%(ext)s" "$1"
}

#}}}
# ---------------------------------------------------------------
#                          UPDATE CMD                         {{{
# ---------------------------------------------------------------


# Homebrew show dependency tree
alias btree='brew deps --installed --tree'
# Homebrew show packages with -1 option
alias brewls='brew ls -1'
# Brew Cask Search
alias bcs='brew search'
# Brew Cask Install
alias bci='brew cask install'
# Brew Cask List
alias bcl='brew cask list -1'


#}}}
# ---------------------------------------------------------------
#                        TERMINAL CMD                         {{{
# ---------------------------------------------------------------


# Enable alias to be sudo'd
alias sudo='sudo '
# Removes all .DS_Store files that it can find recursively
alias killDS='sudo find / -name ".DS_Store" -depth -exec rm {} \;'


# Clear screen and history
alias c='clear && history -c'


# Uses ls command to show only dot files
alias hid="ls -a | grep '^\.'"
# Uses ls command w options -lhA
alias ll='ls -lhA'
#  Recursive ls
alias lr='ll -RN'
# Single column ls
alias l1='ls -1'
# Single column ls w all
alias l1a='ls -1a'
# Common tree command
alias t2='tree -L 2'


# Parses PATH variables nicely
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'


# Alias for diskutil list
alias diskls='diskutil list'


# Makes hidden files visible in Finder
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
# Make hidden files hidden again in Finder
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
# Hide all Desktop items
alias hidedesk='defaults write com.apple.finder CreateDesktop false; killall Finder'
# Show Desktop items again
alias showdesk='defaults write com.apple.finder CreateDesktop true; killall Finder'

#}}}
# ---------------------------------------------------------------
#                              NAV CMD                        {{{
# ---------------------------------------------------------------


# Directory Navigation
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels

# Jumps to desktop
alias de='cd ~/Desktop'
# Jumps to downloads
alias dl='cd ~/Downloads'
# Jumps to Dropbox
alias dp='cd ~/Dropbox'
# Jumps to Drive
alias dr='cd ~/Drive'
# Jumps to Synology 12-bay ds2415+
alias snas='cd /Volumes/Shared/sds'
# Jumps to external hard drive mybook
alias mybook='cd /Volumes/mybook'


# Alias for docker-machine
alias dm='docker-machine'
# Alias for docker-machine create
alias dmcv='docker-machine create --driver virtualbox'

#}}}
# ---------------------------------------------------------------
#                         NAV FUNCTION                        {{{
# ---------------------------------------------------------------


# Combine mkdir and cd
function mkcd (){
  mkdir "$1"
  cd "$1"
}
# Use touch + vim
function tovi (){
  touch "$1"
  vim "$1"
}
# Use touch + vscode
function toco (){
  touch "$1"
  code "$1"
}
# Open file in macdown
function md (){
    open -a Macdown.app "$1"
}
# Inputs directory within projects
function dev (){
    if  [ "ls" == "$1" ]; then
        cd ~/Dev/
        ls -1
    else
     cd ~/Dev/"$1"
    fi
}
function lh (){
    open http://localhost:"$1"
}
# Bash script exec 
function bs (){
  ./"$1"
}
# Flush DNS Cache
function flushdns (){
    echo 'Flushing DNS Cache. Enter your system password.'
    sudo killall -HUP mDNSResponder
}

#}}}
# ---------------------------------------------------------------
#                      HISTORY OPTIONS                        {{{
# ---------------------------------------------------------------

export HISTIGNORE="ls:ll:cd:pwd"
export HISTFILESIZE=3000
export HISTSIZE=3000
export HISTCONTROL=ignoredups:erasedups
export HISTTIMEFORMAT="[$(tput setaf 6)%F %T$(tput sgr0)]: "

#}}}
# ---------------------------------------------------------------
#                           GITHUB CMD                        {{{
# ---------------------------------------------------------------

alias gb='git branch'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gl='git log'
alias glo='git log --pretty=oneline'
alias glu="git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
alias glg="git log --decorate --graph --abbrev-commit --date=relative"
alias gh='git checkout'
alias gt='git tag'
alias grs='git reset'
alias grv='git revert'
alias gm='git merge'
alias gd='git diff'
alias gp='git push'
alias gpo='git push origin'
alias gob='git checkout -b'
alias gh='cat .git/HEAD'
alias grgu='git remote get-url'

alias gbb="git for-each-ref --sort=-committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"
alias gbbb="git for-each-ref --sort=-committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"

#}}}
# ---------------------------------------------------------------
#                           TEMP                              {{{
# ---------------------------------------------------------------

# For gitcontact auth
export GH_EMAIL_TOKEN=fb5d04399a055cef9248b86ccb970426ad92aff7

#}}}