#!/bin/bash
name='skype'
url='https://web.skype.com/'
docker run --rm\
    -v $PWD:/src \
    -v $PWD:/root/.cache/electron \
    ghostry/nativefier \
    nativefier \
    -m --name "$name" \
    -p linux -a x64 \
    --icon /src/icon/$name.png \
    --single-instance \
    --tray \
    --verbose \
    --min-width 400 \
    --min-height 400 \
    --disk-cache-size 52428800 \
    --file-download-options '{"saveAs":true}' \
    --internal-urls "(.*?\.live.com)|(.*?\.skype.com)" \
    "$url" \
    /src/
sudo rm -rf /opt/$name-linux-x64
sudo rm ~/.local/share/applications/$name.desktop
sudo mv $name-linux-x64 /opt/
sudo cp -a desktop/$name.desktop /opt/$name-linux-x64/$name.desktop
ln -s /opt/$name-linux-x64/$name.desktop ~/.local/share/applications/$name.desktop
echo 'done'
