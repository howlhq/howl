# Howl

## Project setup

```
# start up dependencies
docker-compose up -d

# get shell into the docker container
./script/sh
mix do deps.get, ecto.create, ecto.migrate
mix phx.server
```
