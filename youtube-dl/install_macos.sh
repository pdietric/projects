#!/bin/bash

#install brew for easy dependency installation
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#download youtube-dl
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl

#make youtube-dl executable
sudo chmod a+rx /usr/local/bin/youtube-dl

#for extract only audio
brew install ffmpeg

#install for adding thumbnail to file
brew install atomicparsley
