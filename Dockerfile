FROM ubuntu:focal

ENV VERSION 6.18.1

RUN apt-get update && apt-get install -y wget

RUN wget https://github.com/xmrig/xmrig/releases/download/v$VERSION/xmrig-$VERSION-focal-x64.tar.gz

RUN tar -xvzf xmrig-$VERSION-focal-x64.tar.gz

ENV POOL pool.supportxmr.com:3333
ENV USERNAME username
ENV PASSWORD x
ENV DONATE 5
ENV THREADS 2
ENV PRINT_TIME 30

WORKDIR xmrig-$VERSION/

CMD ./xmrig -o $POOL -u $USERNAME -p $PASSWORD -k --donate-level=$DONATE -t $THREADS --cpu-priority 0 --print-time=$PRINT_TIME

