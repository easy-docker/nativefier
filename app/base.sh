#!/bin/bash
name=$1
url=$2
docker run --rm\
    -v $PWD/:/src \
    -v /tmp:/root/.cache/electron \
    ghostry/nativefier \
    nativefier \
    -m --name "$name" \
    --p linux -a x64 \
    --icon /src/icon/$name.png \
    --single-instance \
    --tray \
    --min-width 200 \
    --min-height 200 \
    --disk-cache-size 52428800 \
    "$url" \
    /src/
sudo rm -rf /opt/$name-linux-x64
sudo rm /opt/$name.desktop
sudo rm /usr/share/applications/$name.desktop
sudo mv $name-linux-x64 /opt/
sudo cp -av desktop/$name.desktop /opt/$name.desktop
sudo ln -s /opt/$name.desktop /usr/share/applications/$name.desktop
