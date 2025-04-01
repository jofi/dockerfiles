FROM ubuntu:latest
LABEL maintainer="Peter Drahoš <peter.drahos@innovatrics.com>"
LABEL Description="This image is intended to replace VM based Linux development machines" Vendor="Peter Drahoš" Version="0.3"

# Install basic dependencies
RUN apt-get update && apt-get install -y \
# System
    locales \
# User tools
    zsh \
    tmux \
    vim \
    sudo \
# Build tools
    build-essential \
    pkg-config \
    valgrind \
    strace \
    gdb \
    cmake \
    git \
    clang \
    lldb \
# Ruby
    ruby \
    ruby-dev \
# Python
    python3 \
    python3-pip \
    python3-dev
# && rm -rf /var/lib/apt/lists/*

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Add user and setup home
RUN useradd -m dev && \
    echo "dev:dev" | chpasswd && \
    adduser dev sudo && \
    chsh -s /usr/bin/zsh dev

RUN apt install -y ca-certificates curl gnupg
RUN install -m 0755 -d /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
RUN chmod a+r /etc/apt/keyrings/docker.gpg
RUN echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt update
RUN apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# Add current user to docker group and start docker service
RUN usermod -aG docker dev

ENV PATH=/home/dev/bin:$PATH

VOLUME /home/dev
WORKDIR /home/dev
ENV HOME=/home/dev
USER dev

# Set up shell
CMD ["zsh", "-l"]

