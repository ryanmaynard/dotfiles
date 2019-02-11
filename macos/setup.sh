#!/usr/bin/env bash 

set -x

# INSTALL COMMAND LINE TOOLS
xcode-select -p
if [[ $? -ne 0 ]]; then
    xcode-select --install
fi


# A full installation of Xcode.app is required to compile some formulas like
# macvim. Installing the Command Line Tools only is not enough.
# Also, if Xcode is installed but the license is not accepted then brew will
# fail.
xcodebuild -version
# Accept Xcode license
if [[ $? -ne 0 ]]; then
    # TODO: find a way to install Xcode.app automatticaly
    # See: http://stackoverflow.com/a/18244349
    sudo xcodebuild -license
fi


# UPDATE ALL OSX PACKAGES
sudo softwareupdate -i -a


# INSTALL HOMEBREW IF NOT FOUND
brew --version 2>&1 >/dev/null
if [[ $? -ne 0 ]]; then
    # Clean-up failed Homebrew install
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew update
brew upgrade --all

# BREW TAP CASKROOM
brew tap caskroom/cask

# INSTALL OSX SYSTEM REQUIREMENTS
brew cask install --force xquartz

# INSTALL GNU CORE UTILITIES (THOSE THAT COME WITH MACOS ARE OUTDATED).
# DON’T FORGET TO ADD `$(BREW --PREFIX COREUTILS)/LIBEXEC/GNUBIN` TO `$PATH`.
brew install coreutils
ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# INSTALL SOME OTHER USEFUL UTILITIES LIKE `SPONGE`.
brew install moreutils
# INSTALL GNU `FIND`, `LOCATE`, `UPDATEDB`, AND `XARGS`, `G`-PREFIXED.
brew install findutils
# INSTALL GNU `SED`, OVERWRITING THE BUILT-IN `SED`.
brew install gnu-sed --with-default-names
# INSTALL BASH 4.
# NOTE: DON’T FORGET TO ADD `/USR/LOCAL/BIN/BASH` TO `/ETC/SHELLS` BEFORE
# RUNNING `CHSH`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# SWITCH TO USING BREW-INSTALLED BASH AS DEFAULT SHELL
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# INSTALL WGET WITH IRI SUPPORT
brew install wget --with-iri

# INSTALL MORE RECENT VERSIONS OF SOME MACOS TOOLS.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install homebrew/php/php56 --with-gmp

# HOMEBREW PACKAGES
brewlist=(
	nvm
	rbenv
	tree
	youtube-dl
	)
for i in "${brewlist[@]}"
do
    brew install $i
    echo "Downloading $i"
done

# HOMEBREW CASK APP LIST
brewcasklist=(
    airtable
    alfred
    android-studio
    dash
    datagrip
	dropbox
	firefox
	google-chrome
	iterm2
    knockknock
    macdown
	mou
    postman
    screenflow
    slack
	spotify
    teamviewer
    tunnelblick
    visual-studio-code
	vlc
	)
for i in "${brewcasklist[@]}"
do
    echo "Downloading $i cask"
    brew cask install $i
done

# HOMEBREW BASH COMPLETION SETS
brewbashcompletion=(
    brew-cask-completion
    bundler-completion
    gem-completion
    grunt-completion
    pip-completion
    rails-completion
    rake-completion
    ruby-completion
)
for i in "${brewbashcompletion[@]}"
do
    echo "Downloading $i"
    brew install homebrew/completions/$i
done

#  CLEAN THINGS UP
brew linkapps
brew cleanup
brew prune
brew cask cleanup


# NPM GLOBAL LIST
npmlist=(
    webpack
    yo
    hotel
    http-server
    pug
)
for i in "${npmlist[@]}"
do
    echo "Downloading $i"
    npm install -g $i
done