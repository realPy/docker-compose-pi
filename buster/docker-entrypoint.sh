#!/bin/bash


cd / && git clone https://github.com/docker/compose.git
cd compose
git checkout $TAG

pip3 install --upgrade pip
hash -r pip
pip3 install --upgrade setuptools
pip3 install -r requirements-build.txt
pip3 install -r requirements.txt
./script/build/write-git-sha >  compose/GITSHA
pyinstaller --exclude-module pycrypto --exclude-module PyInstaller docker-compose.spec
