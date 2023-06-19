#!/bin/sh
yum install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gcc make -y
yum install libffi-devel -y 
wget https://www.python.org/ftp/python/3.8.12/Python-3.8.12.tgz
tar -zxvf Python-3.8.12.tgz
cd Python-3.8.12/
./configure
make && make install
mv /usr/bin/python /usr/bin/python.bak
ln -s /usr/local/bin/python3 /usr/bin/python
ln -s /usr/local/bin/pip3 /usr/bin/pip
sed -i 's/bin\/python/bin\/python2/g' /usr/libexec/urlgrabber-ext-down
sed -i 's/bin\/python/bin\/python2/g' /usr/bin/yum



#https://www.yii666.com/blog/335480.html?action=onAll  
