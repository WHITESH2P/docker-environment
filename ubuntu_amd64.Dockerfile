FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
        build-essential \
        cmake \
        curl \
        wget \
        bzip2 \
        sudo \
        git \
        tmux \
        vim && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# language korean
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# Install miniconda3
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh

# add user 
RUN useradd -m sungyeob && echo "sungyeob:0000" | chpasswd && adduser sungyeob sudo
USER sungyeob

# Install miniconda3 (continued)
RUN /opt/conda/bin/conda init bash

# vimrc & tmux config & bashrc setting
RUN mkdir ~/git-repo && \
    cd ~/git-repo && \
    git clone https://github.com/WHITESH2P/terminal-settings.git && \
    cd terminal-settings && \
    cp .vimrc ~/ && \
    cp .tmux.conf ~/ && \
    cat .bashrc >> ~/.bashrc && \
    ./vim-plugInstall.sh && \
    vim +'PlugInstall --sync' +qa && \
    rm -rf ~/git-repo

WORKDIR /home/sungyeob
CMD ["/bin/bash"]
