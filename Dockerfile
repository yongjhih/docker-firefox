FROM ubuntu

#                   adobe-flashplugin \ # not found xenial
#                   ia32-libs \
#                   libglu1-mesa:i386 \ # not found xenial
#                   libglu1-mesa:amd64 \
#                   dbus-x11 \
#                   libxext-dev \
#                   libxrender-dev \
#                   libxtst-dev \
RUN apt-get update && \
    apt-get install -y \
                    --no-install-recommends \
                    sudo \
                    flashplugin-installer \
                    ubuntu-restricted-extras \
                    dbus-x11 \
                    libxext-dev \
                    libxrender-dev \
                    libxtst-dev \
                    firefox && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV USER ubuntu
ENV UID 1000

RUN useradd -m -u $UID $USER && \
    echo "$USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

ADD docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/usr/bin/firefox"]
