# docker build -t jessiebuild:$(date --iso) .
# docker run -v /tmp:/tmp --rm -t -i --name tmp jessiebuild:$(date --iso)

FROM debian:jessie

COPY assets/ /

RUN   apt-get update \
    ; apt-get upgrade -y \
    ; apt-get install -y build-essential devscripts dpkg-dev vim-tiny sudo wget git screen bash-completion vim \
    ; apt-get clean

CMD mkdir /tmp/build \
    ; useradd -d /tmp/build build \
    ; chown build:build /tmp/build \
    ; /bin/bash -c "screen -s /bin/bash"

