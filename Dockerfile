FROM ubuntu:18.04


# set version label
ARG BUILD_DATE
LABEL build_version="xmrig-proxy build-date:- ${BUILD_DATE}"
LABEL maintainer="WeChain"

ARG DEBIAN_FRONTEND=noninteractive

# Prepare directories
RUN mkdir /config

# Install dependencies
RUN apt update && apt -y install \
    build-essential \
    cmake \
    git \
    libmicrohttpd-dev \
    libssl-dev \
    libuv1-dev \
    uuid-dev && \
    rm -rf /var/lib/apt/lists/*

# Get Code
WORKDIR /opt
RUN git clone https://github.com/xmrig/xmrig-proxy && \
    cd xmrig-proxy && \
    git checkout v6.15.0 && \
    sed -i "/^constexpr const int kDefaultDonateLevel = 2;/c\constexpr const int kDefaultDonateLevel = 0;" src/donate.h && \
    mkdir build && \
    cmake -DCMAKE_BUILD_TYPE=Release -DUV_LIBRARY=/usr/lib/x86_64-linux-gnu/libuv.a . && \
    make

# Volume
VOLUME /config
RUN cp /opt/xmrig-proxy/src/config.json /config/config.json

# Ports
EXPOSE 80 7777

# Command
CMD ["/opt/xmrig-proxy/xmrig-proxy", "-c", "/config/config.json"]
