FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    pkg-config \
    gdb \
    clang \
    cmake \
    vim \
    sudo \
    less

ARG DEV_USER=dev
ARG DEV_GROUP=dev
ARG USER_ID=1000
ARG GROUP_ID=1000

WORKDIR /home/${DEV_USER}/dev

# Create a group and user with the specified UID and GID
# On a mac, this is apparently not needed.
RUN groupadd -g ${GROUP_ID} tony
RUN useradd -m -u ${USER_ID} -g ${GROUP_ID} -s /bin/bash ${DEV_USER}
RUN echo 'tony ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER ${DEV_USER}

CMD ["/bin/bash"]
