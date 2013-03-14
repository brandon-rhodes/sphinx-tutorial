#!/bin/bash

set -e

if [ ! -d usb ]
then
    mkdir usb
fi

cd usb

if [ ! -d Mac ]
then
    mkdir Mac
fi

if [ ! -d Windows ]
then
    mkdir Windows
fi

cd Mac
wget -c http://www.python.org/ftp/python/2.7.3/python-2.7.3-macosx10.6.dmg
wget -c http://www.python.org/ftp/python/2.7.3/python-2.7.3-macosx10.3.dmg
cd ..

cd Windows
wget -c http://www.python.org/ftp/python/2.7.3/python-2.7.3.msi
cd ..

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

if [ ! -d triangle-project ]
then
    mkdir triangle-project
fi
cp -r ../triangle-project/setup.py triangle-project
cp -r ../triangle-project/trianglelib triangle-project

echo Done building!
