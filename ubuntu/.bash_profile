#--------------------------------------------------------
#                   	 PATH						                
#--------------------------------------------------------

# Pyenv
export PATH="/home/thanatos/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Goenv
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


#--------------------------------------------------------
#                   	ALIASES						              
#--------------------------------------------------------

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
# Markdown editor remarkable
alias md='remarkable'

# Directory Navigation
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels


#--------------------------------------------------------
#                   	FUNCTIONS					              
#--------------------------------------------------------

# Combine mkdir and cd
function mkcd (){
  mkdir "$1"
  cd "$1"
}

# Bash script exec shortcut
function bs (){
  ./"$1"
}

# Open to localhost
function lh (){
    open http://localhost:"$1"
}

# Touch and open file in Vim
function tovi (){
  touch "$1"
  vim "$1"
}

# Use touch + vscode
function toco (){
  touch "$1"
  code "$1"
}

# Jump to dev
function dev (){
    if  [ "ls" == "$1" ]; then
        cd ~/Dev/
        ls -1
    else
     cd ~/Dev/"$1"
    fi
}

#--------------------------------------------------------
#                   	 GIT						                
#--------------------------------------------------------


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
alias gbb="git for-each-ref --sort=-committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"
alias gbbb="git for-each-ref --sort=-committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"



# ---------------------------------------------------------------
#                           TEMP                              
# ---------------------------------------------------------------


