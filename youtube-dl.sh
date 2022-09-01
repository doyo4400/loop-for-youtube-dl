#verify if youtube-dl is installed
REQUIRED_PKG="youtube-dl"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
  sudo apt-get --yes install $REQUIRED_PKG

else

#define directory
direction=$(pwd)
url_file_location="${direction}/url.txt"
folder_path_for_download="${direction}/music_dl_from_script/"

mkdir $folder_path_for_download

  if [ -f "$url_file_location" ]; then
      #create download folder if is doesn't exist
      if [ ! -d "$folder_path_for_download" ]; then
        mkdir $folder_path_for_download
      fi

      cat $url_file_location | while read line
      do
        # concatenate directory
        directory="${folder_path_for_download}%(title)s.%(ext)s"
        #echo $directory
        youtube-dl --extract-audio --audio-format mp3 $line -o $directory
      done

  else
      echo "$url_file_location does not exist."
  fi


fi
