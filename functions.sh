#!/bin/bash

# if the program is installed, returns 'install ok installed'
getProgramInstallStatus_deb() {
	echo `dpkg-query -W -f='${Status}' "$1"`
}
getProgramInstallStatus_rpm() {
	echo "------: WARN : dpkg-query not available with rpm...TODO: find another command to do this check"
}


# installs a package using Debian specific commands (apt-get)
install_deb() {
	echo "-------------------------------------------------------------------------------------"
	programInstallStatus=$(getProgramInstallStatus_deb $1)

	echo "----: INFO : Attempting to install "$1

	if [ "$programInstallStatus" = "install ok installed" ]; then
		echo "------: WARN : The program "$1" is already installed on your system"
	else
		apt-get -y install $1
	fi
}
# installs a package using RPM specific commands (yum)
install_rpm() {
	echo "-------------------------------------------------------------------------------------"
	programInstallStatus=$(getProgramInstallStatus_rpm $1)

	echo "----: INFO : Attempting to install "$1

	if [ "$programInstallStatus" = "install ok installed" ]; then
		echo "------: WARN : The program "$1" is already installed on your system"
	else
		yum -y install $1	
	fi
}


# creates a directory if it doesn't exist
create_dir_if_it_does_not_exist() {
	if [ $# -ne 1 ]
	then
		echo "--------: ERROR : in $0 - Invalid Argument Count"
		exit
	fi

	if [ -d $1 ]; then
		echo "------: WARN : The directory: " $1 " already exists...skipping"
    else 
        echo "----: INFO : Creating directory: " $1
        mkdir $1
	fi
}

# clears a directory if it exists
# note: the directory should not contain an ending / (one is added by the script)
clear_dir_if_exists(){
	if [ $# -ne 1 ]
	then
		echo "--------: ERROR : in $0 - Invalid Argument Count"
		exit
	fi

	echo "----: INFO : Attempting to clear directory: "$1

	if [ -d $1 ]; then
		echo "----: INFO : Clearing directory: " $1
		rm -Rf $1/*
    	else 
        	echo "------: WARN : The directory: " $1 " doesn't exists...skipping"
	fi
}


# run a script if it is found
run_script() {
	if [ $# -ne 1 ]; then
		echo 
		echo "--------: ERROR : in $0 - Invalid Argument Count"
		echo "--------: required number of arguments: 1; given: "$#
		exit
	fi

	echo "----: INFO : Attempting to run script: "$1

	if [ -f $1 ]; then
		echo "--: OK : Script: "$1" was found and it is being run"
		./$1
	else
		echo "--------: ERROR : in $0 - Script: "$1" not found "
		# TODO: test it and the uncomment it
		# echo "--------: the location may be: "
		# find /opt/ /home/ -type f -name $1
	fi
}

# $1 - filePath
# $2 - fileURL
download_file_if_not_present(){
	if [ $# -ne 2 ]
	then
		echo "--- Error in $0 - Invalid Argument Count"
		exit
	fi

	echo "----: INFO : Download destination: "$1
	echo "----: INFO : URL to download: "$2
	
	if [ -f $1 ]; then
		echo "------: WARN : File: "$1" already exists...skipping download"
	else
		wget $2
		echo "----: INFO : Downloaded: "$2
	fi
}

# $1 - file path
remove_file_if_exists(){
	if [ $# -ne 1 ]
	then
		echo "--------: ERROR : in $0 - Invalid Argument Count"
		exit
	fi
	
	echo "----: INFO : Attempting to remove file: "$1

	if [ -f $1 ]; then
		echo "----: INFO : Removing file: " $1
		rm -f $1
    else 
        echo "------: WARN : The file: " $1 " doesn't exists...skipping"
	fi
}

# $1 - soure file path
# $2 - destination directory (redundant - to be removed)
# $3 - destination file path
copy_src_file_dest_file_with_no_override(){
	if [ $# -ne 3 ]
	then
		echo "--------: ERROR : in $0 - Invalid Argument Count"
		exit
	fi
	

	echo "----: INFO : Attempting to copy "$1" to "$3
	if [ ! -f $1 ]; then
		echo "--------: ERROR : Source: "$1" doesn't exist...exiting"
		exit
	fi

	if [ ! -d $2 ]; then
		echo "--------: ERROR : Destination directory: "$2" doesn't exist...exiting"
		exit
	fi

	if [ -f $3 ]; then
		echo "--------: ERROR : Destination file: "$3" already exists ... skipping copy and returning"
		return 0
	fi

	echo "----: INFO : Destination file: "$3
	echo "----: INFO : Copying "$1" to "$2
	cp $1 $2
}


check_is_root(){
	if [ "`whoami`" != root ]; then
		echo "--------: ERROR : You must be root (or use 'sudo') in order to run this script." >&2
		exit 2
	fi
}

#--: OK : 
#----: INFO : 
#------: WARN : 
#--------: ERROR : 


