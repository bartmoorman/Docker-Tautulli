### Usage
```
docker run \
--rm \
--detach \
--init \
--name tautulli \
--hostname tautulli \
--volume tautulli-config:/config \
--publish 8181:8181 \
bmoorman/tautulli
```
