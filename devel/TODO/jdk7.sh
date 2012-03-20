# http://dlc.sun.com.edgesuite.net/jdk7/binaries/index.html

source ../../functions.sh



create_dir_if_it_does_not_exist /opt/kits
cd /opt/kits/

uname -a | grep 64 > /dev/null
if [ $? == 0 ]; then
  ARCH=x86_64
else
  ARCH=i386
fi
echo "arch is: " $ARCH


if [ $ARCH == i386 ]; then
  JDK_BIN_NAME=jdk-7-ea-bin-b127-linux-i586-27_jan_2011.bin
else
  JDK_BIN_NAME=jdk-7-ea-bin-b127-linux-x64-27_jan_2011.bin
fi

download_file_if_not_present /opt/kits/$JDK_BIN_NAME http://www.java.net/download/jdk7/binaries/$JDK_BIN_NAME

chmod +x *.bin

if [ ! -d "./jdk1.7.0" ]; then
  ./$JDK_BIN_NAME
fi

sudo mv ./jdk1.7.0 /usr/lib/jvm

sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.7.0/jre/bin/java 3

sudo update-alternatives --config java


