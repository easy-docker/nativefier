FROM node:alpine
MAINTAINER Ghostry (ghostry@ghostry.cn)
RUN npm install nativefier -g
RUN mkdir /src ; \
    nativefier --name baidu "http://baidu.com" /src/ ; \
    rm -rf /src/baidu*
WORKDIR /src
