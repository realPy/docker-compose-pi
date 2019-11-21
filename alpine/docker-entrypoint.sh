#!/bin/bash

cd / && git clone https://github.com/docker/compose.git
cd compose
git checkout $TAG
pip install --upgrade pip
pip install --upgrade setuptools
pip install -r requirements-build.txt
pip install -r requirements.txt
./script/build/write-git-sha >  compose/GITSHA
pyinstaller --exclude-module pycrypto --exclude-module PyInstaller docker-compose.spec
