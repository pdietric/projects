#!/bin/bash

USER="yourname"

SRC="/Users/$USER/Music/ytdl/"

DEST="/Users/$USER/Library/Mobile Documents/com~apple~CloudDocs/ytdl/"

rsync --verbose --recursive --delete-before --whole-file --times --exclude=".DS_Store" --progress "$SRC" "$DEST"


#!/bin/bash

USER="pdietric"

DLTMP="/Users/$USER/ytdl_tmp/"

SRC="/Users/$USER/Music/ytdl/"

DEST="/Users/$USER/Library/Mobile Documents/com~apple~CloudDocs/ytdl/"

rsync --verbose --recursive --delete-before --whole-file --times --exclude=".DS_Store" --progress "$SRC" "$DEST"



/Users/pdietric/Music/Automatically Add to Music.localized/ytdl
