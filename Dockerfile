FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    gdb \
    clang \
    cmake \
    vim \
    sudo \
    less \
    && rm -rf /var/lib/apt/lists/*





ARG DEV_USER=dev
ARG DEV_GROUP=dev
ARG DEV_UID=1000
ARG DEV_GID=1000

# Create a group and user with the specified UID and GID
# On a mac, this is apparently not needed.
RUN groupadd -g ${DEV_GID} {DEV_GROUP}
RUN useradd -m -u ${DEV_UID} -g ${DEV_GID} -s /bin/bash ${DEV_USER}
RUN echo 'DEV_USER ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Change ownership to the non-root user
RUN chown -R ${DEV_UID}:${DEV_GID} /home/${DEV_USER}

USER ${DEV_USER}

WORKDIR /home/${DEV_USER}

CMD ["/bin/bash"]
