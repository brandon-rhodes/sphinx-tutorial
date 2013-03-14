#!/bin/bash

set -e

mkdir -p usb

cd usb

mkdir -p Mac
mkdir -p Windows

cd Mac
wget -c http://www.python.org/ftp/python/2.7.3/python-2.7.3-macosx10.6.dmg
wget -c http://www.python.org/ftp/python/2.7.3/python-2.7.3-macosx10.3.dmg
cd ..

cd Windows
wget -c http://www.python.org/ftp/python/2.7.3/python-2.7.3.msi
cd ..

mkdir -p packages

cd packages
wget -c http://pypi.python.org/packages/2.6/S/Sphinx/Sphinx-1.1.3-py2.6.egg
wget -c http://pypi.python.org/packages/2.7/S/Sphinx/Sphinx-1.1.3-py2.7.egg
wget -c http://pypi.python.org/packages/source/S/Sphinx/Sphinx-1.1.3.tar.gz

wget -c http://pypi.python.org/packages/source/P/Pygments/Pygments-1.6.tar.gz
wget -c http://pypi.python.org/packages/2.7/P/Pygments/Pygments-1.6-py2.7.egg
wget -c http://pypi.python.org/packages/2.6/P/Pygments/Pygments-1.6-py2.6.egg

wget -c https://pypi.python.org/packages/source/J/Jinja2/Jinja2-2.6.tar.gz

wget -c https://pypi.python.org/packages/source/d/docutils/docutils-0.10.tar.gz

wget -c http://pypi.python.org/packages/source/v/virtualenv/virtualenv-1.9.1.tar.gz

tar xvfz virtualenv-1.9.1.tar.gz
cd virtualenv-1.9.1
cp virtualenv.py ..
cp -r virtualenv_support ..
cd ..
rm -rf virtualenv-1.9.1
cd ..

cd Sphinx-Tutorial
if [ ! -d triangle-project ]
then
    mkdir triangle-project
fi

cp -r ../../triangle-project/setup.py triangle-project
cp -r ../../triangle-project/trianglelib triangle-project
cp -r ../../triangle-project/texts triangle-project

find triangle-project -name '*.pyc' | xargs rm

echo Done building!
