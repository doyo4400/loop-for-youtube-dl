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


# create webserver with python3 and http.server module.
if ! command -v <the_command> &> /dev/null
then
    	your_ip=$(/sbin/ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1)
	web_server_port="80"
	read -r -p "You want to create http server ? [y/N] " response
	case "$response" in
    		[yY][eE][sS]|[yY])
    			echo "webserver was open on ${folder_path_for_download} on ip : ${your_ip} in port ${web_server_port}"
        		echo "for close the webserver, quit this program with crtl+c !"
        		echo "\n" 
        		python3 -m http.server --directory $folder_path_for_download $web_server_port
        	;;
	esac
   	exit
fi
