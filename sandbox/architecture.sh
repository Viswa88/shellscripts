#!/bin/bash

architecture_test(){
	platform=`uname -m`

	if [ $platform = "x86_64" ]; then
	  echo "64-bit OS"
	elif [ $platform = "i686" ]; then
	  echo "32-bit OS"
	else
	  echo "Unknown platform"
	fi
	
}

