#!/bin/bash
name=$1
url=$2
docker run --rm\
    -v $PWD:/src \
    -v $PWD:/root/.cache/electron \
    ghostry/nativefier \
    nativefier \
    -m --name "$name" \
    --p linux -a x64 \
    --icon /src/icon/$name.png \
    --single-instance \
    --tray \
    --min-width 400 \
    --min-height 400 \
    --disk-cache-size 52428800 \
    --file-download-options '{"saveAs":true}' \
    "$url" \
    /src/
sudo rm -rf /opt/$name-linux-x64
sudo rm /usr/share/applications/$name.desktop
sudo mv $name-linux-x64 /opt/
sudo cp -a desktop/$name.desktop /opt/$name-linux-x64/$name.desktop
sudo ln -s /opt/$name-linux-x64/$name.desktop /usr/share/applications/$name.desktop
echo 'done'
