# Loop-for-youtube-dl
Simple script to download music from youtube.

The music is download in mp3 format and create name in format {Youtube-title}.{extension}

If Python3 is present, the script propose to create an http server for shared the music.

# Prerequisite
> sudo apt install youtube-dl -y

# Format of url.txt : 
> https://youtube.com/url1
> 
> https://youtube.com/url2
> 
> https://youtube.com/url3

# Get musics from http server
## Linux
> wget -r -np -nH -R index.html http://hostname/aaa/bbb/ccc/ddd/

## Windows
> referer to get_music.ps1
