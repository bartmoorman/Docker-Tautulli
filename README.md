### Docker Run
```
docker run \
--detach \
--name tautulli \
--publish 8181:8181 \
--volume tautulli-config:/config \
--volume plex-config:/data:ro \
bmoorman/tautulli:latest
```

### Docker Compose
```
version: "3.7"
services:
  tautulli:
    image: bmoorman/tautulli:latest
    container_name: tautulli
    ports:
      - "8181:8181"
    volumes:
      - tautulli-config:/config
      - plex-config:/data:ro

volumes:
  tautulli-config:
  plex-config:
```
