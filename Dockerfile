# 'agent' is drop-in replacement of its 'slave' predecessor, but with newer updates
FROM jenkins/ssh-agent

RUN apt-get update && apt-get -y install \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg \
        lsb-release \
        && apt-get clean

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
    > /etc/apt/sources.list.d/docker.list

RUN apt-get update && apt-get -y install docker-ce docker-ce-cli \
        && apt-get clean

COPY entrypoint_slave /entrypoint

ENTRYPOINT ["/entrypoint"]
