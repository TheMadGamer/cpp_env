FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    gdb \
    clang \
    cmake \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /home/tony

ARG USER_ID
ARG GROUP_ID

# Create a group and user with the specified UID and GID
# On a mac, this is apparently not needed.
# RUN groupadd -g ${GROUP_ID} tony
RUN useradd -m -u ${USER_ID} -g ${GROUP_ID} -s /bin/bash tony
RUN echo 'tony ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER tony


CMD ["/bin/bash"]
