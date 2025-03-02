FROM python:3.11-slim

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

RUN apt-get update && apt-get install -y --no-install-recommends \
    libopencv-dev \
    python3-opencv \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y libqt5gui5 && \
    rm -rf /var/lib/apt/lists/*

    # Flip this on if you need to debug.
#ENV QT_DEBUG_PLUGINS=1    

ARG USER_NAME=tony
ARG GROUP_NAME=tony

ARG USER_ID
ARG GROUP_ID

WORKDIR /home/${USER_NAME}

# Create a group and user with the specified UID and GID
# On a mac, this is apparently not needed.
RUN groupadd -g ${GROUP_ID} ${GROUP_NAME}
RUN useradd -m -u ${USER_ID} -g ${GROUP_ID} -s /bin/bash ${USER_NAME}
RUN echo "${USER_NAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN adduser ${USER_NAME} video

ENV DISPLAY=:0

USER ${USER_NAME}

CMD ["/bin/bash"]
