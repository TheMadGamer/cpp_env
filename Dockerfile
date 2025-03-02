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

RUN apt-get install -y --no-install-recommends \
    libglib2.0-0 \
    libx11-xcb1

ARG USER_NAME=tony
ARG GROUP_NAME=tony

ARG USER_ID
ARG GROUP_ID

WORKDIR /home/${USER_NAME}

# Create a group and user with the specified UID and GID
# On a mac, this is apparently not needed.
# RUN groupadd -g ${GROUP_ID} tony
# RUN useradd -m -u ${USER_ID} -g ${GROUP_ID} -s /bin/bash ${DEV_USER}
# RUN echo 'tony ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Create a group and user with the specified UID and GID
# On a mac, this is apparently not needed.
RUN groupadd -g ${GROUP_ID} ${GROUP_NAME}
RUN useradd -m -u ${USER_ID} -g ${GROUP_ID} -s /bin/bash ${USER_NAME}
RUN echo "${USER_NAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN adduser ${USER_NAME} video

ENV DISPLAY=:0

USER ${USER_NAME}

CMD ["/bin/bash"]
