FROM node:alpine
MAINTAINER Ghostry (ghostry@ghostry.cn)
RUN npm install nativefier -g
WORKDIR /root/
CMD nativefier
