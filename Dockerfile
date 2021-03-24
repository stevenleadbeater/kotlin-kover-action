FROM ubuntu:20.04
RUN apt-get update --fix-missing
RUN apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common
RUN curl -fLsS https://downloads.mender.io/repos/debian/gpg | apt-key add -
RUN add-apt-repository \
           "deb [arch=amd64] https://downloads.mender.io/repos/debian \
           stable \
           main"
RUN apt-get update
RUN apt-get install -y mender-artifact mender-cli
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]