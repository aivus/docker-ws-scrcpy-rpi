FROM node:20-bookworm
MAINTAINER Illia Antypenko <illia@antypenko.dev>

ENV LANG C.UTF-8
WORKDIR /ws-scrcpy

RUN npm install -g node-gyp
RUN apt update && apt install -y android-tools-adb
RUN git clone https://github.com/NetrisTV/ws-scrcpy.git .
RUN npm install
RUN npm run dist

EXPOSE 8000

CMD ["npm","start"]
