#!/bin/bash

#download youtube-dl
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl

#make youtube-dl executable
sudo chmod a+rx /usr/local/bin/youtube-dl

#for extract only audio
sudo apt install ffmpeg

#install for adding thumbnail to file
sudo apt-get install -y atomicparsley
