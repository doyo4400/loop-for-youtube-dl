url_file_location="/path/of/url.txt"
folder_path_for_download="/path/of/download/folder/"

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
