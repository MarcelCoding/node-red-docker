# Node-RED Docker

[![Releases](https://img.shields.io/github/v/tag/MarcelCoding/node-red-docker?label=latest%20version&style=flat-square)](https://github.com/marcelcoding/node-red-docker/releases)
[![Build](https://img.shields.io/github/workflow/status/MarcelCoding/node-red-docker/CI?label=CI&style=flat-square)](https://github.com/marcelcoding/node-red-docker/actions)
[![DockerHub](https://img.shields.io/docker/pulls/marcelcoding/node-red-docker?style=flat-square)](https://hub.docker.com/r/marcelcoding/node-red-docker)

This is a docker container for [Node-RED](https://nodered.org/). It is based on the
"official" [Node-RED Docker Image](https://github.com/node-red/node-red-docker/) but withe
the [Node-RED Dashboard](https://github.com/node-red/node-red-dashboard)
and [addon](https://github.com/node-red/node-red-ui-nodes/) nodes,
a [dark theme](https://github.com/node-red-contrib-themes/solarized-dark-grey), and some environment variables.

## Deployment

This image is available in [DockerHub](https://hub.docker.com/r/marcelcoding/node-red-docker) and the
[GitHub Container Registry](https://github.com/users/MarcelCoding/packages/container/package/node-red-docker):

```
marcelcoding/node-red-docker:latest
ghcr.io/marcelcoding/node-red-docker:latest
```

### Docker "run" Command

```bash
docker run \
  -p 1880:1880 \
  -e PASSWORD=SECURE_PASSWORD \
  --restart always \
  --rm \
  --mount "./node-red-data:/data"
  marcelcoding/node-red-docker:latest
```

### Docker Compose

````yaml
# docker-compose.yaml
version: '3.8'

services:
  node-red-docker:
    image: marcelcoding/node-red-docker:latest
    restart: always
    environment:
      # - 'USERNAME=admin'           # <- NoVNC "Webinterface" Password (optional)
      - 'PASSWORD=SECURE_PASSWORD' # <- NoVNC Screen Resolution (optional, default: "admin")
    ports:
      - '1880:1880'                # <- Http Web Interface
    volumes:
      - ./node-red-data:/data      # <-- Data Persistance
````

## License

[LICENSE](LICENSE)
