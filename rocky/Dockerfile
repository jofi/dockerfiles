FROM rockylinux:9.3

# Install basic dependencies
RUN yum update -y && yum group install -y 'Development Tools' && yum install -y \
# System
    epel-release \
    glibc-langpack-en \
# User tools
    zsh \
    tmux \
    vim \
    sudo \
# Build tools
    pkgconfig \
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
    python3 \
    python3-pip \
    python3-devel

# Set the locale
RUN localedef -v -c -i en_US -f UTF-8 en_US.UTF-8 ; exit 0
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Add user and setup home
RUN useradd -m dev && \
    echo "dev:dev" | chpasswd && \
    usermod -aG wheel dev && \
    usermod -s /bin/zsh dev

ENV PATH=/home/dev/bin:$PATH

RUN yum install -y yum-utils
RUN yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
RUN yum install -y docker-ce docker-ce-cli containerd.io
# Install docker compose as a plugin
RUN DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker} && \
    mkdir -p $DOCKER_CONFIG/cli-plugins && \
    curl -SL https://github.com/docker/compose/releases/download/v2.17.2/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose && \
    chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose

# Add current user to docker group and start docker service
RUN usermod -aG docker dev

VOLUME /home/dev
WORKDIR /home/dev
ENV HOME=/home/dev
USER dev

# Set up shell
CMD ["/bin/zsh", "-l"]
