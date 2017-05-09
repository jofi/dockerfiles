FROM ubuntu:latest
MAINTAINER Peter Drahoš <peter.drahos@innovatrics.com>
LABEL Description="This image is intended to replace VM based Linux development machines" Vendor="Peter Drahoš" Version="0.3"

# Install basic dependencies
RUN apt-get update && apt-get install -y \
# System
    locales \
# User tools
    docker \
    zsh \
    tmux \
    vim \
    curl \
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
    python \
    python-pip \
    python-dev \
    python3-dev
# && rm -rf /var/lib/apt/lists/*

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Ruby and Python modules
RUN gem install parallel ffi
RUN pip install protobuf

# Add user and setup home
RUN useradd -m dev && \
    echo "dev:dev" | chpasswd && \
    adduser dev sudo && \
    chsh -s /usr/bin/zsh dev

ENV PATH /home/dev/bin:$PATH

VOLUME /home/dev
WORKDIR /home/dev
ENV HOME /home/dev
USER dev

# Set up shell
CMD zsh -l

