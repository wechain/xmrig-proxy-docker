# xmrig-proxy-docker




# xmrig-proxy docker container

[![Docker Stars](https://img.shields.io/docker/stars/kadeeke/xmrig-proxy.svg)](https://hub.docker.com/r/kadeeke/xmrig-proxy/)[![Docker Pulls](https://img.shields.io/docker/pulls/kadeeke/xmrig-proxy.svg)](https://hub.docker.com/r/kadeeke/xmrig-proxy/)[![Docker Build Status](https://img.shields.io/docker/build/kadeeke/xmrig-proxy.svg)](https://hub.docker.com/r/kadeeke/xmrig-proxy/)

This container allows running [xmrig-proxy](https://github.com/xmrig/xmrig-proxy) in a docker container.

## Docker

This docker image in available on [docker hub](https://hub.docker.com/r/kadeeke/xmrig-proxy/).

## Example

```bash
# run a dockerized miner
# -o and all following arguments are passed to the xmrig-proxy miner process
docker run --rm -it -d -p <PUBLIC_PORT>:3333 --name xmrig-proxy wechain/xmrig-proxy -o <POOL_URL>:<POOL_PORT> -u <YOUR_WALLET> -p x --bind 0.0.0.0:3333
```

If you want to know all the possible options, run:

```bash
docker run --rm -it wechain/xmrig-proxy
```

You could also use a config file:

```bash
docker run --rm -it -d -p <PUBLIC_PORT>:3333 --name xmrig-proxy -v ./config.json:/usr/local/bin/config.json wechain/xmrig-proxy
```

```bash
docker run -p 7777:3333 wechain/xmrig-proxy -o sg.minexmr.com:4444 -u 865kjopGVkABniUeparZntDDNDP3eMrVz1UFvBXSuTjb8ZfYTyQSt9GRsVeBFXhFCwK7zmqvh7a4dCrwSyo3r9GGNstLLR2 --rig-id C1 --keepalive --bind 0.0.0.0:3333
```

## Building

The [Dockerfile](https://github.com/wechain/xmrig-proxy-docker/blob/master/Dockerfile) uses [multi-stage builds](https://docs.docker.com/develop/develop-images/multistage-build/) for building the `xmrig-proxy` app.

So building is as simple as:

```bash
docker build -t <your docker tag> .
```
