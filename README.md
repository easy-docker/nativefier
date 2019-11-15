# docker-nativefier
docker-nativefier
# 使用方法
例如 telegram
```
wget https://web.telegram.org/img/logo_share.png -O telegram.png
docker run --rm \
    ghostry/nativefier \
    -m --name 'telegram' \
    --p linux -a x64 \
    --icon /src/telegram.png \
    --single-instance \
    --tray \
    --min-width 200 \
    --min-height 200 \
    'https://web.telegram.org/' \
    /src/
```
