FROM jenkins/ssh-slave

RUN apt-get update && apt-get -y install \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg2 \
        software-properties-common \
        && apt-get clean

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

RUN add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/debian \
        $(lsb_release -cs) \
        stable"

RUN apt-get update && apt-get -y install docker-ce docker-ce-cli \
        && apt-get clean

COPY entrypoint_slave /entrypoint

ENTRYPOINT ["/entrypoint"]
