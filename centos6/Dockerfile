FROM centos:6
MAINTAINER Jozef Fulop <jozef.fulop@innovatrics.com>
LABEL Description="This image is intended to replace VM based Linux development machines" Vendor="Jozef Fulop" Version="0.1"

# Install basic dependencies
RUN yum update -y && yum group install -y 'Development Tools' && yum install -y \
# System
    epel-release \
    locales \
# User tools
    docker \
    zsh \
    tmux \
    vim \
    curl \
    sudo \
# Build tools
#    build-essential \
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
    ruby-devel \
    libffi-devel \
# Python
    python \
    python-pip \
    python-devel \
    python3-devel
# && rm -rf /var/lib/apt/lists/*

# Set the locale
RUN localedef -v -c -i en_US -f UTF-8 en_US.UTF-8 ; exit 0
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Ruby and Python modules
RUN gem install parallel ffi
#RUN pip install protobuf

# Add user and setup home
RUN useradd -m dev && \
    echo "dev:dev" | chpasswd && \
    usermod -aG wheel dev && \
    chsh -s /usr/bin/zsh dev

ENV PATH /home/dev/bin:$PATH

VOLUME /home/dev
WORKDIR /home/dev
ENV HOME /home/dev
USER dev

# Set up shell
CMD zsh -l
